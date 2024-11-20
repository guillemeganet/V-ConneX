package com.mycompany.infyvcard

import android.content.Intent
import android.nfc.NfcAdapter
import android.nfc.Tag
import androidx.annotation.NonNull
import com.example.my_project.NfcWriter // Asegúrate de que esta clase exista y sea funcional
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    companion object {
        private const val CHANNEL = "com.mycompany.infyvcard/nfcWriter"
    }

    var url: String? = null
    var mResult: MethodChannel.Result? = null
    lateinit var nfcWriter: NfcWriter

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Inicializa el objeto NfcWriter
        nfcWriter = NfcWriter(this)

        // Configura el MethodChannel para comunicarte con Flutter
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "write") {
                url = call.arguments as String
                mResult = result
                // Aquí simplemente guardamos la URL para usarla cuando se detecte la etiqueta NFC
            } else {
                result.notImplemented()
            }
        }
    }

    private var isNfcTagDetected = false

    // Este método es llamado cuando se detecta una nueva intención (tag NFC)
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)

        val detectedTag: Tag? = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG)

        // Verifica si la URL está definida y si la etiqueta NFC fue detectada
        if (url != null && mResult != null && detectedTag != null) {
            if (NfcAdapter.ACTION_TAG_DISCOVERED.equals(intent.action)) {
                // Si la URL está definida, intentamos escribir en la etiqueta NFC
                val success = nfcWriter.write(url!!, detectedTag) // Aquí pasamos la URL y la etiqueta detectada
                mResult!!.success(success) // Retornamos el resultado de la operación
            }
        }
    }

    override fun onResume() {
        super.onResume()
        // Habilita el "foreground dispatch" para que la app pueda recibir etiquetas NFC
        nfcWriter.enableForegroundDispatch()
    }

    override fun onPause() {
        super.onPause()
        // Desactiva el "foreground dispatch" para cuando la app esté en segundo plano
        nfcWriter.disableForegroundDispatch()
    }
}
