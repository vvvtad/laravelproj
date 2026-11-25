<?php

use Illuminate\Http\Client\Request;
use Illuminate\Support\Facades\Http;

test('weather endpoint returns and caches weather for valid coordinates', function () {
    Http::preventStrayRequests();
    Http::fake([
        'api.openweathermap.org/*' => Http::response([
            'name' => 'Manila',
            'main' => [
                'temp' => 30.5,
                'humidity' => 65,
            ],
            'weather' => [
                ['description' => 'clear sky'],
            ],
        ]),
    ]);
    config(['services.openweather.key' => 'test-weather-key']);

    $url = route('weather.show', [
        'lat' => '14.5995',
        'lon' => '120.9842',
    ]);

    $this->getJson($url)
        ->assertOk()
        ->assertExactJson([
            'place' => 'Manila',
            'temperature' => 30.5,
            'description' => 'clear sky',
            'humidity' => 65,
        ]);
    $this->getJson($url)->assertOk();

    Http::assertSentCount(1);
    Http::assertSent(fn (Request $request): bool => str_contains($request->url(), 'appid=test-weather-key'));
});

test('weather endpoint validates coordinates before making an external request', function () {
    Http::preventStrayRequests();

    $this->getJson(route('weather.show', [
        'lat' => '91',
        'lon' => '181',
    ]))
        ->assertUnprocessable()
        ->assertJsonValidationErrors(['lat', 'lon']);

    Http::assertNothingSent();
});

test('weather endpoint reports when its server-side key is missing', function () {
    Http::preventStrayRequests();
    config(['services.openweather.key' => null]);

    $this->getJson(route('weather.show', [
        'lat' => '14.5995',
        'lon' => '120.9842',
    ]))
        ->assertServiceUnavailable()
        ->assertJson(['message' => 'Weather service is not configured.']);

    Http::assertNothingSent();
});
