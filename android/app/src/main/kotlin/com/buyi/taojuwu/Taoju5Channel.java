package com.buyi.taojuwu;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Handler;
import android.util.Log;
import android.view.Surface;

import androidx.annotation.NonNull;

import com.facebook.common.executors.CallerThreadExecutor;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.imagepipeline.core.ImagePipeline;
import com.facebook.imagepipeline.datasource.BaseBitmapDataSubscriber;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imagepipeline.request.ImageRequestBuilder;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.TextureRegistry;

public class Taoju5Channel implements  MethodChannel.MethodCallHandler {

    private Activity activity;
    private FlutterEngine engine;

    private  MethodChannel channel;




    private TextureRegistry.SurfaceTextureEntry surfaceTexture;

    Taoju5Channel(Activity activity,FlutterEngine engine){
        this.activity=activity;
        this.engine =engine;
        this.channel = new MethodChannel(engine.getDartExecutor().getBinaryMessenger(), "com.buyi.taoju5.fresco");
        this.channel.setMethodCallHandler(this);
    }


    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
    if(call.method=="loadImage"){
        String url = (String) ((Map) call.arguments).get("url");
        loadImage(url,result);
    }
    }


    void loadImage(String url, @NonNull MethodChannel.Result result){
        ImageRequest imageRequest = ImageRequestBuilder
                .newBuilderWithSource(Uri.parse(url))
                .setProgressiveRenderingEnabled(true)
                .build();
        ImagePipeline imagePipeline = Fresco.getImagePipeline();
        DataSource<CloseableReference<CloseableImage>>
                dataSource = imagePipeline.fetchDecodedImage(imageRequest, this.activity);


        dataSource.subscribe(new BaseBitmapDataSubscriber() {
            @Override
            public void onNewResultImpl(Bitmap bitmap) {
                if (bitmap == null) {
                    activity.runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            result.error("111","获取图片失败",null);
                        }
                    });
                    // Log.e(TAG,"保存图片失败啦,无法下载图片");
                return;
                }
                int imageWidth = bitmap.getWidth();
                int imageHeight = bitmap.getHeight();
                long textureId = surfaceTexture.id();

                Map<String,Object> reply = new HashMap<>();
                reply.put("textureId",textureId);
                reply.put("width",imageWidth);
                reply.put("height",imageHeight);
                Log.i("fresco------------",reply.toString());
                Log.i("fresco",reply.toString());
                Rect rect = new Rect(0,0,200,200);
                surfaceTexture.surfaceTexture().setDefaultBufferSize(imageWidth,imageHeight);
                Surface surface = new Surface(surfaceTexture.surfaceTexture());
                Canvas canvas = surface.lockCanvas(rect);
                canvas.drawBitmap(bitmap,null,rect,null);
                bitmap.recycle();
                surface.unlockCanvasAndPost(canvas);
                activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        result.success(reply);
                    }
                });
//             handler.post(new Runnable(){
//
//                 @Override
//                 public void run() {
//result.success(result);
//                 }
//             });

            }

            @Override
            public void onFailureImpl(DataSource dataSource) {
                activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        result.error("111","获取图片失败",null);
                    }
                });
            }
        }, CallerThreadExecutor.getInstance());

    }

    private void createSurfaceTextureEntry() {
        if (this.surfaceTexture != null)return;
        surfaceTexture = engine.getRenderer().createSurfaceTexture();
    }
}
