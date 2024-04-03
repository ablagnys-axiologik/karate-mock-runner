package com.payment;

import com.intuit.karate.core.MockServer;

public class KarateMockRunner {
    
    private static MockServer server;

    public static void main(String[] args) {
        // Start the Karate mock server
        startServer();

        // Register a shutdown hook to stop the server gracefully
        Runtime.getRuntime().addShutdownHook(new Thread(() -> stopServer()));

        // Wait for the user to press Enter to exit

        try {
            System.in.read();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void startServer() {
        // Set the feature file directory (adjust as needed)

        // Start the Karate server
        server = MockServer.feature("classpath:payment-mock.feature").http(8080).build();

        System.out.println("Karate mock server started on port: " + server.getPort());
    }

    private static void stopServer() {
        if (server != null) {
            System.out.println("Stopping Karate mock server...");
            server.stop();
            System.out.println("Karate mock server stopped.");
        }
    }
}