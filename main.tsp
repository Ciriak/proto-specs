import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "@typespec/json-schema";
import "./models/Airport.tsp";
import "./models/User.tsp";
import "./models/Error.tsp";
import "./models/Auth.tsp";
import "./models/Notam.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@service(#{ title: "AeroDB API" })
@info(#{ title: "AeroDB API", version: "1.0.0" })
namespace AeroDbService;

@error
model Error {
  status: int32;
  code: int32;
  message: string;
}

@tag("Airport")
@route("/airports")
namespace Airports {
  /**
   * Get a list of airports.
   */
  @get
  op list(@query limit?: int32 = 100, @query page?: int32 = 1): {
    @statusCode statusCode: 200;
    @body airports: Airport[];
  };

  /**
   * Get an airport by ID.
   */
  @get
  op get(@path airportId: int32): {
    @statusCode statusCode: 200;
    @body airport: Airport;
  } | Http.NotFoundResponse;

  /**
   * Create a new airport.
   */
  @post
  @useAuth(ApiKeyAuth<ApiKeyLocation.query, "apiKey">)
  op create(@body airport: Airport): {
    @statusCode statusCode: 201;
    @body newAirport: Airport;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  };

  /**
   * Update an airport.
   */
  @patch(#{ implicitOptionality: true })
  @useAuth(ApiKeyAuth<ApiKeyLocation.query, "apiKey">)
  op update(@path airportId: int32, @body airport: Airport): {
    @statusCode statusCode: 200;
    @body updatedAirport: Airport;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };

  /**
   * Delete an airport by ID.
   */
  @delete
  @useAuth(ApiKeyAuth<ApiKeyLocation.query, "apiKey">)
  op delete(@path airportId: int32): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };
}

@tag("User")
@route("/users")
@useAuth(ApiKeyAuth<ApiKeyLocation.query, "apiKey">)
namespace Users {
  /**
   * Get a list of users.
   */
  @get
  op list(@query limit?: int32 = 100, @query page?: int32 = 1): {
    @statusCode statusCode: 200;
    @body users: User[];
  };

  /**
   * Get a user by ID.
   */
  @get
  op get(@path userId: int32): {
    @statusCode statusCode: 200;
    @body user: User;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };

  /**
   * Create a new user.
   */
  @post
  op create(@body user: User): {
    @statusCode statusCode: 201;
    @body newUser: User;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  };

  /**
   * Update a user.
   */
  @patch(#{ implicitOptionality: true })
  op update(@path userId: int32, @body user: User): {
    @statusCode statusCode: 200;
    @body updatedUser: User;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };

  /**
   * Delete a user by ID.
   */
  @delete
  op delete(@path userId: int32): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };

  /**
   * Refresh the API key for a user.
   */
  @route("{userId}/refreshApiKey")
  @post
  op refreshApiKey(@path userId: int32): {
    @statusCode statusCode: 200;
    @body user: User;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };
}

@tag("Auth")
namespace Auth {
  /**
   * Authenticate a user and return a JWT token.
   */
  @route("/login")
  @post
  op login(
    @body credentials: {
      email: string;
      password: string;
    },
  ): {
    @statusCode statusCode: 200;
    @body credentials: AuthCredentials;
  } | {
    @statusCode statusCode: 401;
    @body error: UnauthorizedError;
  };

  /**
   * Create a new user account.
   */
  @route("/signup")
  @post
  op signUp(@body user: User): {
    @statusCode statusCode: 201;
    @body newUser: User;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  };

  /**
   * Refresh the JWT token using a refresh token.
   */
  @route("/refreshToken")
  @post
  op refreshToken(@body token: string): {
    @statusCode statusCode: 201;
    @body credentials: AuthCredentials;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  };

  /**
   * Get the current user based on the JWT token.
   */
  @route("/me")
  @useAuth(BearerAuth)
  @get
  op getCurrentUser(): {
    @statusCode statusCode: 200;
    @body user: User;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  };
}

@tag("Notam")
@route("/notams")
@useAuth(ApiKeyAuth<ApiKeyLocation.query, "apiKey">)
namespace Notams {
  /**
   * Get a list of NOTAMs.
   */
  @get
  op list(@query limit?: int32 = 100, @query page?: int32 = 1): {
    @statusCode statusCode: 200;
    @body notams: Notam[];
  };

  /**
   * Get a NOTAM by ID.
   */
  @get
  op get(@path notamId: int32): {
    @statusCode statusCode: 200;
    @body notam: Notam;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };

  /**
   * Create a new NOTAM.
   */
  @post
  op create(@body notam: Notam): {
    @statusCode statusCode: 201;
    @body newNotam: Notam;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  };

  /**
   * Update a NOTAM.
   */
  @patch(#{ implicitOptionality: true })
  op update(@path notamId: int32, @body notam: Notam): {
    @statusCode statusCode: 200;
    @body updatedNotam: Notam;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };

  /**
   * Delete a NOTAM by ID.
   */
  @delete
  op delete(@path notamId: int32): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  };
}
