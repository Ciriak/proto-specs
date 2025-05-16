import "./Frequency.tsp";
import "./Runway.tsp";

@example(#{
    id: "1",
    createdAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
    updatedAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
    icaoCode: "KATL",
    name: "Hartsfield–Jackson Atlanta International Airport",
    iataCode: "ATL",
    localCode: "ATL",
    latitude: 33.6407,
    longitude: -84.4277,
    elevation: 1026,
    countryCode: "US",
    city: "Atlanta",
    state: "Georgia",
    county: "Fulton",
    continentCode: ContinentCode.NA,
    timezone: "America/New_York",
    facilityType: FACILITY_TYPE.InternationalAirport,
    isPrivate: false,
    isClosed: false,
    frequencies: #[
        #{
            name: "ATIS",
            type: "ATIS",
            description: "Automatic Terminal Information Service",
            frequency: 118.4,
        },
        #{
            name: "Ground Control",
            type: "Ground",
            description: "Ground Control Frequency",
            frequency: 121.9,
        },
        #{
            name: "Tower Control",
            type: "Tower",
            description: "Tower Control Frequency",
            frequency: 118.3,
        }
    ],
    runways: #[
        #{
            name: "Runway 8L",
            length: 12000,
            width: 150,
            isClosed: false,
            isLighted: true,
            lowEndIdent: "8L",
            lowEndElevation: 1026,
            lowEndHeading: 80,
            lowEndDisplacedThreshold: 0,
            lowEndLatitude: 33.6407,
            lowEndLongitude: -84.4277,
            highEndIdent: "26R",
            highEndElevation: 1026,
            highEndHeading: 260,
            highEndDisplacedThreshold: 0,
            highEndLatitude: 33.6407,
            highEndLongitude: -84.4277,
        }
    ],
})
model Airport {
    /**
     * UUID of the airport
     */
    @visibility(Lifecycle.Read)
    id: string;

    @invisible(Lifecycle)
    createdAt: utcDateTime;

    @visibility(Lifecycle.Read)
    updatedAt: utcDateTime;

    @minLength(3)
    @maxLength(200)
    name: string;

    @pattern("^[A-Z]{4}$")
    icaoCode?: string;

    @pattern("^[A-Z]{3}$")
    iataCode?: string;

    localCode?: string;
    latitude?: float;
    longitude?: float;
    elevation?: int32;

    /**
     * ISO 3166-1 alpha-2 country code
     */
    @pattern("^[A-Z]{2}$")
    countryCode?: string;

    @minLength(2)
    @maxLength(50)
    city?: string;

    @minLength(2)
    @maxLength(50)
    state?: string;

    @minLength(2)
    @maxLength(50)
    county?: string;

    continentCode?: ContinentCode;

    @minLength(2)
    @maxLength(100)
    timezone?: string;

    facilityType?: FACILITY_TYPE;
    isPrivate?: boolean;
    isClosed?: boolean;
    frequencies: Frequency[];
    runways: Runway[];
}

enum ContinentCode {
    AF: "AF",
    AN: "AN",
    AS: "AS",
    EU: "EU",
    NA: "NA",
    OC: "OC",
    SA: "SA",
    UN: "UN",
}

enum FACILITY_TYPE {
    Airport: "Airport",
    GliderSite: "GliderSite",
    AirfieldCivil: "AirfieldCivil",
    InternationalAirport: "InternationalAirport",
    HeliportMilitary: "HeliportMilitary",
    MilitaryAerodrome: "MilitaryAerodrome",
    UltraLightFlyingSite: "UltraLightFlyingSite",
    HeliportCivil: "HeliportCivil",
    AerodromeClosed: "AerodromeClosed",
    AirportIFR: "AirportIFR",
    AirfieldWater: "AirfieldWater",
    LandingStrip: "LandingStrip",
    AgriculturalLandingStrip: "AgriculturalLandingStrip",
    Altiport: "Altiport",
}
