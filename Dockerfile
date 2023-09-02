# USING NODE BASE IMAGE TO "BUILD" OUR APPLICATION
FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm ci 

# BUILDING OUR RUNNER IMAGE
FROM gcr.io/distroless/nodejs20-debian11
COPY --from=build /app /app
WORKDIR /app
CMD ["index.js"]