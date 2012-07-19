package {

import flash.display.Sprite;
import flash.text.TextField;

public class AndroidStarling extends Sprite {
    public function AndroidStarling() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
    }
}
}
