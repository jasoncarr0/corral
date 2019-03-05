use "cli"
use "../bundle"
use "../util"


primitive CmdInit
  fun apply(ctx: Context, cmd: Command) =>
    //ctx.log.info("init: " + cmd.string())

    // TODO: try to read first to convert/update existing file(s)
    match BundleFile.create_bundle(ctx.env, ctx.log)
    | let bundle: Bundle =>
      try
        bundle.save()?
        ctx.log.info("init: created: " + bundle.name())
      else
        ctx.env.out.print("init: could not create " + bundle.name())
        ctx.env.exitcode(1)
      end
    | let err: Error =>
      ctx.env.out.print("init: " + err.message)
      ctx.env.exitcode(1)
    end
