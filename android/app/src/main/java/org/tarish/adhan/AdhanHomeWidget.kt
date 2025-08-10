package org.tarish.adhan

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.os.Bundle
import android.widget.RemoteViews
import android.util.TypedValue
import android.view.View
import es.antonborri.home_widget.HomeWidgetPlugin

/**
 * Implementation of App Widget functionality.
 */
class AdhanHomeWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            
            updateWidget(context, appWidgetManager, appWidgetId)
        }
    }

    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: Bundle
    ) {
        super.onAppWidgetOptionsChanged(context, appWidgetManager, appWidgetId, newOptions)
        updateWidget(context, appWidgetManager, appWidgetId)
    }

    private fun updateWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int
    ) {
        val options = appWidgetManager.getAppWidgetOptions(appWidgetId)
        val minW = options?.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH) ?: 0
        val minH = options?.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_HEIGHT) ?: 0
        val isCompact = minW < 150 || minH < 120

        val prefs = HomeWidgetPlugin.getData(context)
        val name = prefs?.getString("next_prayer_name", "Prayer") ?: "Prayer"
        val time = prefs?.getString("next_prayer_time", "--") ?: "--"
        val remaining = prefs?.getString("time_remaining", "") ?: ""
        val city = prefs?.getString("location_city", "") ?: ""
        val country = prefs?.getString("location_country", "") ?: ""

        val ampm = if (time.endsWith("AM") || time.endsWith("PM")) time.takeLast(2) else ""
        val timeMain = if (ampm.isNotEmpty()) time.dropLast(2).trim() else time

        val combined = if (remaining.isNotEmpty()) "$name · $time ($remaining)" else "$name · $time"

        val views = RemoteViews(context.packageName, R.layout.adhan_home_widget).apply {
            setTextViewText(R.id.text_prayer_name, name)
            setTextViewText(R.id.text_prayer_time, timeMain)
            setTextViewText(R.id.text_prayer_ampm, ampm)
            if (isCompact) {
                setTextViewText(R.id.text_location_line1, "")
                setTextViewText(R.id.text_location_line2, "")
                setViewVisibility(R.id.image_logo, View.GONE)
                // Shrink time and hide AM/PM in compact to avoid clipping
                setTextViewTextSize(R.id.text_prayer_time, TypedValue.COMPLEX_UNIT_SP, 32f)
                setViewVisibility(R.id.text_prayer_ampm, View.GONE)
            } else {
                setTextViewText(R.id.text_location_line1, city)
                setTextViewText(R.id.text_location_line2, country)
                setViewVisibility(R.id.image_logo, View.VISIBLE)
                // Restore larger time and show AM/PM
                setTextViewTextSize(R.id.text_prayer_time, TypedValue.COMPLEX_UNIT_SP, 42f)
                setViewVisibility(R.id.text_prayer_ampm, View.VISIBLE)
            }
        }
        appWidgetManager.updateAppWidget(appWidgetId, views)
    }

    override fun onEnabled(context: Context) {
        // Called when the first widget is added
    }

    override fun onDisabled(context: Context) {
        // Called when the last widget is removed
    }
}

// Legacy helper removed; updates handled in onUpdate