package com.buyi.taojuwu

import android.Manifest
import android.os.Bundle
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        // 必须给存储权限啊，要不然tinker的补丁无法写入本地文件夹
        ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.WRITE_EXTERNAL_STORAGE), 1001)
        super.onCreate(savedInstanceState)
        Taoju5Channel(this,flutterEngine!!)
    }
}
