require "./do_not_peek_behind_the_curtain/bad_code"

Comment  = Struct.new(:id, :parent_id, :nesting)
comments = [
  [1,  nil, "0001"],
  [2,  nil, "0002"],
  [3,  2,   "0002.0001"],
  [4,  nil, "0003"],
  [5,  3,   "0003.0001"],
  [6,  3,   "0003.0002"],
  [7,  nil, "0004"],
  [8,  nil, "0005"],
  [9,  8,   "0005.0001"],
  [10, 9,   "0005.0001.0001"],
  [11, 8,   "0005.0002"],
  [12, 8,   "0005.0005"],
  [13, 8,   "0005.0006"],
].map { |args| Comment.new(*args) }

BadCode.show_expected_results(comments)
# >> <ul>
# >>   <li>0001</li>
# >>   <li>0002
# >>     <ul>
# >>       <li>0002.0001</li>
# >>     </ul>
# >>   </li>
# >>   <li>0003
# >>     <ul>
# >>       <li>0003.0001</li>
# >>       <li>0003.0002</li>
# >>     </ul>
# >>   </li>
# >>   <li>0004</li>
# >>   <li>0005
# >>     <ul>
# >>       <li>0005.0001
# >>         <ul>
# >>           <li>0005.0001.0001</li>
# >>         </ul>
# >>       </li>
# >>       <li>0005.0002</li>
# >>       <li>0005.0005</li>
# >>       <li>0005.0006</li>
# >>     </ul>
# >>   </li>
# >> </ul>
