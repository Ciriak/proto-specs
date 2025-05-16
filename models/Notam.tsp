@example(#{
    id: "67155d167139c42577c75279",
    notamId: "A0611/24",
    message: """
        A0611/24 NOTAMN
            Q) LSAS/QFATT/IV/BO/A/000/999/4614N00607E005
            A) LSGG B) 2410310000 C) 2411132359
            E) TRIGGER NOTAM - PERM AIRAC AMDT 010/2024:
            MAG VAR REVISED. 
            RDO NAV AND LDG AIDS GLA, GVA AND SPR DELETED AND PAS, LOC 22, 
            DME 22 AND LOC 04 REVISED. 
            FLT PROC SPECIAL REGULATION FOR GENEVA TMA/CTR REVISED. 
            SEVERAL SID AND STAR REVISED. 
            ADC, AOC AND ARC REVISED.
            IAC SRA RWY 04 AND IAC SRA RWY 22 WITHDRAWN. 
            SEVERAL IAC REVISED.
        """,
    transactionId: "73707264",
    icao: "LSGG",
    issueDate: utcDateTime.fromISO("2024-09-19T04:00:00.000+00:00"),
    startDate: utcDateTime.fromISO("2024-09-19T04:00:00.000+00:00"),
    endDate: utcDateTime.fromISO("2024-09-19T04:00:00.000+00:00"),
    source: "USNS",
    sourceType: "I",
    mapPointer: "POINT(6.10895 46.23806389)",
    geometry: "POINT(5105901.28612306 4966695.40062213)",
    createdAt: utcDateTime.fromISO("2024-09-19T04:00:00.000+00:00"),
    updatedAt: utcDateTime.fromISO("2024-09-19T04:00:00.000+00:00"),
})
model Notam {
    /**
     * UUID of the notam
     */
    @visibility(Lifecycle.Read)
    id: string;

    @invisible(Lifecycle)
    createdAt: utcDateTime;

    @visibility(Lifecycle.Read)
    updatedAt: utcDateTime;

    notamId?: string;

    /**
     * The NOTAM message text.
     */
    @minLength(1)
    @maxLength(1000)
    message: string;

    transactionId?: string;

    @pattern("^[A-Z]{4}$")
    icao?: string;

    issueDate?: utcDateTime;
    startDate?: utcDateTime;
    endDate?: utcDateTime;
    source?: string;
    sourceType?: string;
    mapPointer?: string;
    geometry?: string;
}
