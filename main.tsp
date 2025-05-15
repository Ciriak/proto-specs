import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./models/Airport.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
@service(#{ title: "AeroDB API" })
@info(#{ title: "AeroDB API", version: "1.0.0", summary: "AeroDB API" })
namespace AeroDbService;

@error
model Error {
  status: int32;
  code: int32;
  message: string;
}

@route("/airports")
@tag("Airport")
interface Airports {
  /**
   * Get a list of airports
   */
  @get list(
    @offset skip?: int32 = 0,
    @pageSize perPage?: int32 = 100,
  ): Airport[] | Error;
  /**
   * Get a single airport
   */
  @get read(@path id: string): Airport | Error;
  /** Create an airport */
  @post create(@body body: Create<Airport>): Airport | Error;
  /** Update an airport */
  @useAuth(ApiKeyAuth<ApiKeyLocation.query, "apiKey">)
  @patch
  update(
    @path id: string,
    @body body: MergePatchUpdate<Airport>,
  ): Airport | Error;
  /** Delete an airport */
  @delete delete(@path id: string): void | Error;
}
