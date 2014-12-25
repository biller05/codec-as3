/**
 * ...
 * Author: SiuzukZan <minoscc@gmail.com>
 * Date: 14/12/8 17:31
 */
package cc.minos.codec.mp4.boxs {
    import cc.minos.codec.mp4.MP4Constants;

    public class MoovBox extends Box {

        private var _mvhdBox:MvhdBox;
        private var _traks:Vector.<Box>;

        public function MoovBox()
        {
            super( MP4Constants.BOX_TYPE_MOOV );
        }

        override protected function init():void
        {
            trace('moov ======' );
            _mvhdBox = getBox( MP4Constants.BOX_TYPE_MVHD ).shift() as MvhdBox;
            _traks = getBox( MP4Constants.BOX_TYPE_TRAK );

            trace('streams: ' + _traks.length );
        }

        public function get mvhdBox():MvhdBox
        {
            return _mvhdBox;
        }

        public function get traks():Vector.<Box>
        {
            return _traks;
        }
    }
}
