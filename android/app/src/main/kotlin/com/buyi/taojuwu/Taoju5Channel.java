package com.buyi.taojuwu;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.net.Uri;
import android.os.Handler;
import android.text.TextUtils;
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


    private HashMap<String,TextureRegistry.SurfaceTextureEntry> textureSurfaces = new HashMap<>();


    Taoju5Channel(Activity activity,FlutterEngine engine){
        this.activity=activity;
        this.engine =engine;
        this.channel = new MethodChannel(engine.getDartExecutor().getBinaryMessenger(), "com.buyi.taoju5.fresco");
        this.channel.setMethodCallHandler(this);
    }


    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if(call.method.equals("loadImage")){
        String url = (String) ((Map) call.arguments).get("url");
        TextureRegistry.SurfaceTextureEntry surfaceTextureEntry  = textureSurfaces.get(url);

        loadImage(url,result);
    }
        else if (call.method.equals("release")) {
            release(call,result);
        } else {
            result.notImplemented();
        }
    }


    void loadImage(String url, @NonNull MethodChannel.Result result){
        TextureRegistry.SurfaceTextureEntry surfaceTextureEntry  = textureSurfaces.get(url);
        //不为空获取到textureId加载图片
        if (surfaceTextureEntry != null) {
            Map<String, Object> reply = new HashMap<>();
            reply.put("textureId", surfaceTextureEntry.id());
            _loadImage(reply, result, url, surfaceTextureEntry);
        }else{
            surfaceTextureEntry =engine.getRenderer().createSurfaceTexture();
            Map<String, Object> reply = new HashMap<>();
            reply.put("textureId", surfaceTextureEntry.id());
            textureSurfaces.put(url,surfaceTextureEntry);
            _loadImage(reply, result, url, surfaceTextureEntry);
        }
    }


    private void _loadImage(final Map<String, Object> maps, final MethodChannel.Result result, String url, final TextureRegistry.SurfaceTextureEntry surfaceTextureEntry){

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
//                    activity.runOnUiThread(new Runnable() {
//                        @Override
//                        public void run() {
//                            result.error("111","获取图片失败",null);
//                        }
//                    });
//                    // Log.e(TAG,"保存图片失败啦,无法下载图片");
                    return;
                }
                int imageWidth = bitmap.getWidth();
                int imageHeight = bitmap.getHeight();

                Rect rect = new Rect(0, 0, imageWidth, imageHeight);

                SurfaceTexture surfaceTexture = surfaceTextureEntry.surfaceTexture();
                surfaceTexture.setDefaultBufferSize(imageWidth, imageHeight);
                Surface surface = new Surface(surfaceTexture);
                Canvas canvas = surface.lockCanvas(rect);
                canvas.drawBitmap(bitmap, null, rect, null);
                surface.unlockCanvasAndPost(canvas);
                long textureId  = surfaceTextureEntry.id();

                maps.put("textureId", surfaceTextureEntry.id());
                maps.put("width", imageWidth);
                maps.put("height", imageHeight);
                Log.i("fresco=========", "获取surface出错");
                activity.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        result.success(maps);
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

    void _loadImage(String url, @NonNull MethodChannel.Result result){

        ImageRequest imageRequest = ImageRequestBuilder
                .newBuilderWithSource(Uri.parse(url))
                .setProgressiveRenderingEnabled(true)
                .build();
        ImagePipeline imagePipeline = Fresco.getImagePipeline();
        DataSource<CloseableReference<CloseableImage>>
                dataSource = imagePipeline.fetchDecodedImage(imageRequest, this.activity);

    }



    /**
     * 释放
     * @param call
     * @param result
     */
    private  void release(
            MethodCall call,
            MethodChannel.Result result) {
        String url = call.argument("url");

        if (TextUtils.isEmpty(url)) {
            Map<String, Object> maps = new HashMap<>();
            result.error("error", "url is null", maps);
            return;
        }
        try {
            TextureRegistry.SurfaceTextureEntry surfaceTextureEntry = textureSurfaces.remove(url);
            if (surfaceTextureEntry != null) {
                //TODO 回收时怎么处理
                surfaceTextureEntry.release();
                result.success("1");
            } else {
                result.success("0");
            }
        } catch (Exception e) {
            result.error("error", "relese fail", "");
        }


    }
}
