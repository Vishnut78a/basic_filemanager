package com.example.basicversion

import android.os.Environment
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"storage")
        channel.setMethodCallHandler { call, result ->
            if(call.method=="externalStorage"){
                result.success(Environment.getExternalStorageDirectory().path)
            }
        }
    }
}
