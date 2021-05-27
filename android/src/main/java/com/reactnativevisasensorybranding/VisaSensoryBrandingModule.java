package com.reactnativevisasensorybranding;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.os.Handler;
import android.view.View;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.module.annotations.ReactModule;
import com.visa.SensoryBrandingCompletionHandler;
import com.visa.SensoryBrandingView;

@ReactModule(name = VisaSensoryBrandingModule.NAME)
public class VisaSensoryBrandingModule extends ReactContextBaseJavaModule {
    public static final String NAME = "VisaSensoryBranding";

    public VisaSensoryBrandingModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @ReactMethod
    public void show(ReadableMap traits, Promise promise) {
        Activity activity = getCurrentActivity();
        Dialog animation = new Dialog(activity, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
        View sensoryBrandingViewContainer = activity.getLayoutInflater().inflate(R.layout.sensory_branding_view, null);
        SensoryBrandingView sensoryBrandingComponent = (SensoryBrandingView) sensoryBrandingViewContainer.findViewById(R.id.sensory_branding_view_component);
        sensoryBrandingComponent.setCheckMarkShown(traits.hasKey("checkMarkShown") ? traits.getBoolean("checkMarkShown") : false);
        sensoryBrandingComponent.setBackdropColor(traits.hasKey("backdropColor") ? Color.parseColor(traits.getString("backdropColor")) : Color.parseColor("#15195A"));
        sensoryBrandingComponent.setSoundEnabled(traits.hasKey("soundEnabled") ? traits.getBoolean("soundEnabled") : false);
        sensoryBrandingComponent.setHapticFeedbackEnabled(traits.hasKey("hapticFeedbackEnabled") ? traits.getBoolean("hapticFeedbackEnabled") : false);
        animation.setContentView(sensoryBrandingViewContainer);
        animation.show();
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    sensoryBrandingComponent.animate(new SensoryBrandingCompletionHandler(){
                    @Override
                    public void onComplete(Error error) {
                        animation.hide();
                        promise.resolve(true);
                    }
                });
                } catch (Exception ew) {
                    animation.hide();
                    promise.resolve(false);
                }
            }
        }, 100);
    }
}
