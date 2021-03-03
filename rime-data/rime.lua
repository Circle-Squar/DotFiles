function date_translator(input, seg)
   if (input == "jjad") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("jjad", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
      yield(Candidate("jjad", seg.start, seg._end, os.date("%m-%d"), ""))
      yield(Candidate("jjad", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
      yield(Candidate("jjad", seg.start, seg._end, os.date("%m-%d-%Y"), ""))
   end
   if (input == "jfuj") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("jfuj", seg.start, seg._end, os.date("%H:%M:%S"), ""))
      yield(Candidate("jfuj", seg.start, seg._end, os.date("%H:%M"), ""))
	   yield(Candidate("jfuj", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), ""))
   end
end

--- 过滤器：单字在先
function single_char_first_filter(input)
   local l = {}
   for cand in input:iter() do
      if (utf8.len(cand.text) == 1) then
         yield(cand)
      else
         table.insert(l, cand)
      end
   end
   for i, cand in ipairs(l) do
      yield(cand)
   end
end
