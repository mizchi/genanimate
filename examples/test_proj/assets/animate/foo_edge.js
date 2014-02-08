/**
 * Adobe Edge: symbol definitions
 */
(function($, Edge, compId){
//images folder
var im='images/';

var fonts = {};


var resources = [
];
var symbols = {
"stage": {
   version: "2.0.1",
   minimumCompatibleVersion: "2.0.0",
   build: "2.0.1.268",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
         dom: [
         {
            id:'wow-8',
            type:'image',
            rect:['153px','77px','200px','200px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"wow-8.gif",'0px','0px']
         },
         {
            id:'Text',
            type:'text',
            rect:['209px','304px','253px','45px','auto','auto'],
            text:"Wow",
            font:['\'ヒラギノ角ゴ Pro W3\', \'Hiragino Kaku Gothic Pro\', \'メイリオ\', Meiryo, \'ＭＳＰゴシック\', MS PGothic, sans-serif',[24,""],"rgba(0,0,0,1)","normal","none",""]
         },
         {
            id:'Ellipse',
            type:'ellipse',
            rect:['422px','188px','55px','67px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'EllipseCopy',
            type:'ellipse',
            rect:['367px','250px','55px','67px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'EllipseCopy2',
            type:'ellipse',
            rect:['353px','99px','55px','67px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'EllipseCopy3',
            type:'ellipse',
            rect:['58px','193px','55px','67px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'EllipseCopy4',
            type:'ellipse',
            rect:['98px','99px','55px','67px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_Ellipse}": [
            ["style", "left", '422px'],
            ["style", "top", '188px']
         ],
         "${_EllipseCopy4}": [
            ["style", "top", '99px'],
            ["style", "left", '98px']
         ],
         "${_Text}": [
            ["style", "left", '209px'],
            ["style", "top", '304px']
         ],
         "${_wow-8}": [
            ["style", "left", '153px'],
            ["style", "top", '77px']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(255,255,255,1)'],
            ["style", "width", '550px'],
            ["style", "height", '400px'],
            ["style", "overflow", 'hidden']
         ],
         "${_EllipseCopy}": [
            ["style", "left", '367px'],
            ["style", "top", '250px']
         ],
         "${_EllipseCopy2}": [
            ["style", "left", '353px'],
            ["style", "top", '99px']
         ],
         "${_EllipseCopy3}": [
            ["style", "top", '193px'],
            ["style", "left", '58px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 0,
         autoPlay: true,
         timeline: [
         ]
      }
   }
}
};


Edge.registerCompositionDefn(compId, symbols, fonts, resources);

/**
 * Adobe Edge DOM Ready Event Handler
 */
$(window).ready(function() {
     Edge.launchComposition(compId);
});
})(jQuery, AdobeEdge, "EDGE-794526206");
