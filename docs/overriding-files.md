# Overriding harness templates

Sometimes you may need to completely replace a file in the harness with a version of your own. This should be avoided if possible, because they make harness updates on your application a bit more cumbersome and also bloat your repository. Before considering a template override, make sure you have looked at the [attributes](harness-attributes.md) available to see if you can use these to make the change you require.

If you are absolutely sure a template override is required, then you can follow these steps

1. Define an overlay directory in your `workspace.yml`:

       workspace('my-go-app'):
         description: local workspace for my-go-app
         harness: inviqa/go:v0.6.0
         overlay: tools/workspace

1. Create the `tools/workspace` directory, relative to the root of your application's repository.
1. Find the template that you want to override in your project's `.my127ws` directory, for this example we will use the `.my127ws/docker/image/app/Dockerfile.twig` file.
1. Copy this file to the same path within your `tools/workspace` overlay directory, e.g. `tools/workspace/docker/image/app/Dockerfile.twig`
1. Make your necessary changes to the new file you just created.
1. Verify that it's in the correct place by running `ws harness prepare`. This should run templating and overwrite the harness version of that file with your new version.
1. Run a full `ws install` and make sure you are happy with the changes
1. Commit the new file override that you added in the `tools/workspace` directory, along with the `workspace.yml` change to add the overlay directory.

> _After you have implemented your template override in your application please consider creating an issue in this harness repository so that we can avoid that override in future._
