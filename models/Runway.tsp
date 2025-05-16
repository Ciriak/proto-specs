model Runway {
    name: string;
    length?: int32;
    width?: int32;
    isClosed?: boolean;
    isLighted?: boolean;
    lowEndIdent?: string;
    lowEndElevation?: int32;
    lowEndHeading?: int32;
    lowEndDisplacedThreshold?: int32;
    lowEndLatitude?: float32;
    lowEndLongitude?: float32;
    highEndIdent?: string;
    highEndElevation?: int32;
    highEndHeading?: int32;
    highEndDisplacedThreshold?: int32;
    highEndLatitude?: float32;
    highEndLongitude?: float32;
}
