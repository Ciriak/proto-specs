@example(#{
    id: "1",
    icao: "KATL",
    name: "Hartsfield–Jackson Atlanta International Airport",
})
model Airport {
    @visibility(Lifecycle.Read)
    id: string;

    icao: string;

    @minLength(3)
    @maxLength(12)
    name: string;
}
