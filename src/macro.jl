export @i_str, @when, @nogc

"""
i"39": x -> x[39]
i"f"q: x -> x["f"]
i".f": x -> x.f
"""
macro i_str(ind, flag="")
    ex = if flag == "q"
        parse("x[\"$ind\"]")
    elseif car(ind) == '.'
        parse("x$ind")
    else
        parse("x[$ind]")
    end
    ex.args[1] = gensym()
    ex.args[2] = esc(ex.args[2])
    Expr(:->, ex.args[1], ex)
end

macro when(exp)
    :( !$(esc(exp)) && continue )
end

macro retry(times, exp)
    quote
        let i = 0
            @label retry
            try
                $exp
            catch
                i >= $times && rethrow()

                i += 1
                yield()
                @goto retry
            end
        end
    end
end

macro retry(exp)
    :(@retry 3 $exp)
end

macro nogc(ex)
    quote
        try
            gc_disable()
            $(esc(ex))
        finally
            gc_enable()
        end
    end
end
