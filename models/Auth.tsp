import "./User.tsp";

model AuthCredentials {
    /**
     * JWT token
     */
    token: string;

    /**
     * Refresh token
     */
    refreshToken: string;

    /**
     * User object
     */
    user: User;
}
