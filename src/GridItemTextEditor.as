package
{
    import spark.components.TextInput;
    import spark.components.gridClasses.GridItemEditor;
    import spark.events.TextOperationEvent;

    public class GridItemTextEditor extends GridItemEditor
    {
        private var _textInput:TextInput;

        public function GridItemTextEditor() {
            super();
        }

        /**
         * Focus at child component.
         */        
        override public function setFocus():void {
            if (null != _textInput) {
                _textInput.setFocus();
            }
        }

        /**
         * value getter
         */        
        override public function get value():Object {
            if (null == _textInput) {
                return null;
            } else {
                return _textInput.text;
            }
        }

        /**
         * value setter
         */
        override public function set value(newValue:Object):void {
            super.value = newValue;
            if (newValue != null) {
                this.removeAllElements();
                _textInput = new TextInput();
                _textInput.percentWidth = 100;
                _textInput.text = newValue.toString();
                this.addElement(_textInput);
            }
        }
        /**
         * Set TextField#restrict.
         */ 
        public function set restrict(value:String):void {
            this.callLater(function():void {_textInput.restrict = value;});
        }
        /**
         * Set TextField#maxChars.
         */ 
        public function set maxChars(value:int):void {
            this.callLater(function():void {_textInput.maxChars = value;});
        }
    }
}