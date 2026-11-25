<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link
        rel="stylesheet"
        href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
        integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
        crossorigin=""
    >
    <title>Apply for Membership | Membership Portal</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>Membership Application</h2>

        @if (session('success'))
        <div class="success-message" role="status">{{ session('success') }}</div>
        @endif

        @if ($errors->any())
        <div class="error-message" role="alert">
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        <form
            id="membership-application-form"
            class="application-form"
            action="{{ route('membership.store') }}"
            method="POST"
            data-weather-url="{{ route('weather.show') }}"
        >
            @csrf

            <section class="application-fields">
                <h3>Applicant details</h3>

                <div class="application-field">
                    <label for="membership-category">Membership category</label>
                    <select id="membership-category" name="membership_category_id" required>
                        <option value="">Choose a category</option>
                        @foreach ($categories as $category)
                        <option
                            value="{{ $category->id }}"
                            @selected(old('membership_category_id') == $category->id)
                        >
                            {{ $category->name }}
                        </option>
                        @endforeach
                    </select>
                </div>

                @if ($categories->isEmpty())
                <p>No active membership categories are currently available. Please contact the membership office.</p>
                @endif

                <div class="application-field">
                    <label for="full-name">Full name</label>
                    <input id="full-name" type="text" name="full_name" value="{{ old('full_name') }}" maxlength="150" required>
                </div>

                <div class="application-field">
                    <label for="email">Email</label>
                    <input id="email" type="email" name="email" value="{{ old('email') }}" maxlength="255" required>
                </div>

                <div class="application-field">
                    <label for="password">Create password</label>
                    <input id="password" type="password" name="password" autocomplete="new-password" minlength="8" required>
                    <p>You can sign in with this password after an administrator approves your application.</p>
                </div>

                <div class="application-field">
                    <label for="password-confirmation">Confirm password</label>
                    <input id="password-confirmation" type="password" name="password_confirmation" autocomplete="new-password" minlength="8" required>
                </div>

                <div class="application-field">
                    <label for="phone">Phone</label>
                    <input id="phone" type="tel" name="phone" value="{{ old('phone') }}" maxlength="30">
                </div>

                <div class="application-field">
                    <label for="address">Address</label>
                    <input id="address" type="text" name="address" value="{{ old('address') }}" maxlength="255">
                </div>
            </section>

            <section class="application-location">
                <h3>Choose your location</h3>
                <p class="application-location-copy">Click the map to set the location for your application.</p>

                <div id="membership-map" class="application-map" role="application" aria-label="OpenStreetMap location picker"></div>
                <p id="map-status" class="application-map-status" role="status"></p>

                <input id="latitude" type="hidden" name="latitude" value="{{ old('latitude', '14.5995') }}">
                <input id="longitude" type="hidden" name="longitude" value="{{ old('longitude', '120.9842') }}">

                <p id="coordinates" class="application-coordinates" aria-live="polite">
                    Latitude: {{ old('latitude', '14.5995') }}, Longitude: {{ old('longitude', '120.9842') }}
                </p>

                <div class="application-weather">
                    <h4>Current weather</h4>
                    <p id="weather" role="status">Weather will appear for the selected location.</p>
                </div>
            </section>

            <div class="application-submit">
                <button type="submit" @disabled($categories->isEmpty())>Submit application</button>
            </div>
        </form>
    </main>

    <script
        src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
        crossorigin=""
    ></script>
    <script>
        const mapContainer = document.getElementById('membership-map');
        const mapStatus = document.getElementById('map-status');
        const weatherStatus = document.getElementById('weather');
        const latitudeInput = document.getElementById('latitude');
        const longitudeInput = document.getElementById('longitude');
        const coordinates = document.getElementById('coordinates');
        const weatherUrl = document.getElementById('membership-application-form').dataset.weatherUrl;
        const defaultLatitude = 14.5995;
        const defaultLongitude = 120.9842;

        if (typeof L === 'undefined') {
            mapStatus.textContent = 'The map could not be loaded. The default coordinates will be used.';
        } else {
            const readCoordinate = (value, minimum, maximum, fallback) => {
                const coordinate = Number(value);

                return Number.isFinite(coordinate) && coordinate >= minimum && coordinate <= maximum
                    ? coordinate
                    : fallback;
            };
            const initialLatitude = readCoordinate(latitudeInput.value, -90, 90, defaultLatitude);
            const initialLongitude = readCoordinate(longitudeInput.value, -180, 180, defaultLongitude);
            const map = L.map(mapContainer).setView([initialLatitude, initialLongitude], 13);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap contributors</a>'
            }).addTo(map);

            const marker = L.marker([initialLatitude, initialLongitude]).addTo(map);
            let weatherRequest;

            const loadWeather = async (latitude, longitude) => {
                if (weatherRequest) {
                    weatherRequest.abort();
                }

                weatherRequest = new AbortController();
                weatherStatus.textContent = 'Loading weather...';

                try {
                    const query = new URLSearchParams({
                        lat: latitude.toFixed(7),
                        lon: longitude.toFixed(7)
                    });
                    const response = await fetch(`${weatherUrl}?${query}`, {
                        headers: { Accept: 'application/json' },
                        signal: weatherRequest.signal
                    });

                    if (!response.ok) {
                        throw new Error('Weather request failed.');
                    }

                    const weather = await response.json();

                    if (typeof weather.temperature !== 'number' || typeof weather.description !== 'string') {
                        throw new Error('Weather response was incomplete.');
                    }

                    weatherStatus.textContent = `${weather.place}: ${weather.temperature}°C, ${weather.description}, humidity ${weather.humidity}%`;
                } catch (error) {
                    if (error.name !== 'AbortError') {
                        weatherStatus.textContent = 'Weather is currently unavailable.';
                    }
                }
            };

            const setLocation = (latitude, longitude) => {
                latitudeInput.value = latitude.toFixed(7);
                longitudeInput.value = longitude.toFixed(7);
                coordinates.textContent = `Latitude: ${latitude.toFixed(5)}, Longitude: ${longitude.toFixed(5)}`;
                marker.setLatLng([latitude, longitude]);
                loadWeather(latitude, longitude);
            };

            map.on('click', (event) => {
                setLocation(event.latlng.lat, event.latlng.lng);
            });

            setLocation(initialLatitude, initialLongitude);
        }
    </script>
</body>

</html>
