package com.jhb.flutterlearnart.flutter_learn_art

import android.os.Bundle
import android.view.Window
import android.view.WindowManager

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.JSONMethodCodec
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMethodCodec
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.*

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        val channel = BasicMessageChannel<Any>(flutterView, "截屏的标志", StandardMethodCodec.INSTANCE);

        channel.setMessageHandler { p0, p1 ->
            if (p0 != null && p0 is Boolean) {
                window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
            } else {
                window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
            }
        }


    }
}
