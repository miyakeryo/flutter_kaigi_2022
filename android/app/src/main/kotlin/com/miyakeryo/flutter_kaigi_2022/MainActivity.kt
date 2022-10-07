package com.miyakeryo.flutter_kaigi_2022

import android.content.res.Configuration
import android.content.res.Resources
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        KaigiChannel.setup(this, flutterEngine)
    }

    fun getNavigationBarHeight(): Float {
        val resources = this.resources

        val resName = if (resources.configuration.orientation == Configuration.ORIENTATION_PORTRAIT) {
            "navigation_bar_height"
        } else {
            "navigation_bar_height_landscape"
        }

        val id: Int = resources.getIdentifier(resName, "dimen", "android")

        return if (id > 0) {
            resources.getDimensionPixelSize(id) / resources.displayMetrics.density
        } else {
            0f
        }
    }
}
