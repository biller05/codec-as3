/**
 * ...
 * Author: SiuzukZan <minoscc@gmail.com>
 * Date: 14/12/18 14:22
 */
package cc.minos.codec.mp4.boxs {
    import cc.minos.codec.mp4.MP4Constants;

    public class MdhdBox extends Box {

        private var _version:uint;
        private var _timeScale:uint;
        private var _duration:uint;

        public function MdhdBox()
        {
            super(MP4Constants.BOX_TYPE_MDHD);
        }

        override protected function init():void
        {
            data.position = 8;
            //
            trace('mdhd ========');
            _version = data.readUnsignedByte();
            if(_version == 1)
            {
                data.position += 17;
                _timeScale = data.readUnsignedInt();
            }else
            {
                data.position += 11;
                _timeScale = data.readUnsignedInt();
                _duration = data.readUnsignedInt();
            }
            trace('scale: ' + _timeScale, 'duration: ' + _duration );
        }

        public function get timeScale():uint
        {
            return _timeScale;
        }

        public function get duration():uint
        {
            return _duration;
        }
    }
}
