@error
model NotFoundError {
    statusCode: 404;
    name: "Not Found";
    message: string;
}

@error
model ValidationError {
    statusCode: 400;
    name: "Bad Request";
    message: string;
    details: string[];
}

@error
model UnauthorizedError {
    statusCode: 401;
    name: "Unauthorized";
    message: string;
}
