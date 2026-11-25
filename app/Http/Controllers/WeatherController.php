<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;

class WeatherController extends Controller
{
    public function show(Request $request): JsonResponse
    {
        $coordinates = $request->validate([
            'lat' => ['required', 'numeric', 'between:-90,90'],
            'lon' => ['required', 'numeric', 'between:-180,180'],
        ]);

        $apiKey = config('services.openweather.key');

        if (! is_string($apiKey) || $apiKey === '') {
            return response()->json(['message' => 'Weather service is not configured.'], 503);
        }

        $latitude = (float) $coordinates['lat'];
        $longitude = (float) $coordinates['lon'];
        $cacheKey = sprintf('openweather:%0.7f:%0.7f', $latitude, $longitude);

        $weather = Cache::remember($cacheKey, now()->addMinutes(10), function () use ($apiKey, $latitude, $longitude): array {
            return Http::connectTimeout(3)
                ->timeout(10)
                ->get('https://api.openweathermap.org/data/2.5/weather', [
                    'lat' => $latitude,
                    'lon' => $longitude,
                    'units' => 'metric',
                    'appid' => $apiKey,
                ])
                ->throw()
                ->json();
        });

        return response()->json([
            'place' => data_get($weather, 'name') ?: 'Selected location',
            'temperature' => data_get($weather, 'main.temp'),
            'description' => data_get($weather, 'weather.0.description'),
            'humidity' => data_get($weather, 'main.humidity'),
        ]);
    }
}
