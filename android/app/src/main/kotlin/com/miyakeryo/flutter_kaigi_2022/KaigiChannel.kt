package com.miyakeryo.flutter_kaigi_2022

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object KaigiChannel {
    private val kChannel = "com.miyakeryo.flutter_kaigi_2022/KaigiChannel"
    private lateinit var methodChannel: MethodChannel

    fun setup(activity: MainActivity, flutterEngine: FlutterEngine) {
        methodChannel = MethodChannel(flutterEngine.dartExecutor, kChannel)
        methodChannel.setMethodCallHandler { call, result -> onMethodCall(call, result, activity) }
    }

    private fun onMethodCall(call: MethodCall, result: MethodChannel.Result, activity: MainActivity) {
        try {
            when (call.method) {
                "getNavigationBarHeight" -> {
                    result.success(activity.getNavigationBarHeight())
                }
                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            result.error("" + e.message, e.localizedMessage, "" + e.cause)
        }
    }
}