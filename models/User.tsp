@example(#{
    id: "1",
    username: "john_doe",
    email: "john.doe@aerodb.net",
    createdAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
    updatedAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
    password: "password123",
    isVerified: true,
    apiKey: "adb1234567890",
})
model User {
    @visibility(Lifecycle.Read)
    id: string;

    @minLength(3)
    @maxLength(50)
    username: string;

    @minLength(3)
    @maxLength(50)
    @pattern("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
    email: string;

    @minLength(8)
    @maxLength(100)
    @visibility(Lifecycle.Create)
    @secret
    password: string;

    @visibility(Lifecycle.Read)
    createdAt: utcDateTime;

    @visibility(Lifecycle.Read)
    updatedAt: utcDateTime;

    @visibility(Lifecycle.Read)
    isVerified: boolean;

    @invisible(Lifecycle)
    verificationDate?: utcDateTime;

    @visibility(Lifecycle.Read)
    apiKey: string;

    @invisible(Lifecycle)
    lastSeen?: utcDateTime;
}
