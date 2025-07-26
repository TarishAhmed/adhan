package org.tarish.adhan

import android.annotation.SuppressLint
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.ContentValues
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.os.PowerManager
import android.provider.Settings
import android.content.Context
import android.media.RingtoneManager
import android.os.Build
import android.provider.MediaStore
import android.webkit.MimeTypeMap
import androidx.annotation.RequiresApi
import androidx.core.content.FileProvider
import androidx.core.net.toUri
import java.io.File

class MainActivity: FlutterActivity() {
    private val CHANNEL = "app_system_utils"

    @RequiresApi(Build.VERSION_CODES.M)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            println("call.method :: ${call.arguments}")
            
                when (call.method) {
                    "isIgnoringBatteryOptimizations" -> {
                        result.success(isIgnoringBatteryOptimizations())
                    }

                    "requestDisableBatteryOptimization" -> {
                        requestDisableBatteryOptimization()
                        result.success(true)
                    }

                    "openBatteryOptimizationSettings" -> {
                        openBatteryOptimizationSettings()
                        result.success(true)
                    }

                    "getNotificationChannels" -> {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                            val notificationChannels = getNotificationChannels(context)
                            result.success(notificationChannels)
                        } else {
                            result.error(
                                "PLATFORM_VERSION_NOT_SUPPORTED",
                                "Platform version not supported.",
                                null
                            )
                        }
                    }

                    "getUriForFile" -> {
                        val path = call.argument<String>("path")
                        if (path == null){
                            result.error(
                                "NO_PATH_PROVIDED",
                                "No path provided.",
                                null
                            )
                        }
                        val file = File(path)
                        val uri = FileProvider.getUriForFile(
                            context,
                            "org.tarish.adhan.fileprovider",
                            file
                        )



                        result.success(uri.toString())

                    }

                    "getAlarmUri" -> {
                        result.success(
                            RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM).toString()
                        )
                    }

                    else -> {

                        result.notImplemented()
                    }
                }
            
        }
            

    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun isIgnoringBatteryOptimizations(): Boolean {
        val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager
        val packageName = packageName
        return powerManager.isIgnoringBatteryOptimizations(packageName)
    }

    @SuppressLint("BatteryLife")
    @RequiresApi(Build.VERSION_CODES.M)
    private fun requestDisableBatteryOptimization() {
        val intent = Intent().apply {
            action = Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
            data = "package:$packageName".toUri()
        }
        startActivity(intent)
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun openBatteryOptimizationSettings() {
        val intent = Intent().apply {
            action = Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS
        }
        startActivity(intent)
    }

    @RequiresApi(Build.VERSION_CODES.O)
    fun getNotificationChannels(context: Context): List<NotificationChannel> {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        return notificationManager.notificationChannels
    }
}
