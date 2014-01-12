syntax clear javaScriptDocComment
syntax region javaScriptDocComment        matchgroup=javaScriptComment start="/\*\*\s*$"  end="\*/" contains=javaScriptDocTags,javaScriptCommentTodo,@javaScriptHtml

call JavaScriptFold()
