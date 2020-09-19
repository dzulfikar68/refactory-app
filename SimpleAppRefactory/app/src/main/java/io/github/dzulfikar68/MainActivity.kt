package io.github.dzulfikar68

import android.os.Bundle
import android.os.Handler
import android.text.SpannableStringBuilder
import androidx.appcompat.app.AppCompatActivity
import androidx.core.widget.addTextChangedListener
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), TextUndoRedo.TextChangeInfo {

    private var TUR: TextUndoRedo? = null
    private var click = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        TUR = TextUndoRedo(simpleEditText, this)
        simpleEditText?.addTextChangedListener {
            simpleTextView?.text = it?.toString()
        }

        undoRedoButton?.setOnClickListener {
            clickDetection(singleClick = {
                if (TUR?.canUndo() == true) TUR?.exeUndo()
            }, doubleClick = {
                if (TUR?.canRedo() == true) TUR?.exeRedo()
            })
        }

        reverseButton?.setOnClickListener {
            val reversedText = SpannableStringBuilder(simpleEditText?.text?.reversed())
            simpleTextView?.text = reversedText
        }
    }

    private fun clickDetection(singleClick: () -> Unit, doubleClick: () -> Unit) {
        click += 1
        if (click == 1) {
            Handler().postDelayed({
                if (click == 1) singleClick() else doubleClick()
                click = 0
            }, 300)
        }
    }

    override fun textAction() {
        TextUndoRedo.TextChangeInfo {
            undoRedoButton?.isEnabled = TUR?.canRedo() ?: false
            undoRedoButton?.isEnabled = TUR?.canUndo() ?: false
        }
    }
}