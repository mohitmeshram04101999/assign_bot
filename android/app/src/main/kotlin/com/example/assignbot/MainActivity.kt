package com.example.assignbot

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.satyakabir.chatapp.Notifications // Corrected package name

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Notifications.createNotificationChannels(this)
    }
}
