package it.polimi.db2.controllers;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

import java.io.IOException;

/**
 * This is a utility class that provides Thymeleaf features without the need to repeat
 * all the ugly boilerplate code. It defaults to loading ALL pages from the /WEB-INF/templates/ folder,
 * in UTF-8 encoding and in HTML format.
 */
public class Thymeleaf {
    /**
     * This method renders a template with a given context. You have to build your own context.
     *
     * @param templateName the name of the template page, for example "home" or "login"
     * @param ctx WebContext object cointaining useful data that Thymeleaf might want to render
     * @throws IOException if there's some issue with the rendering
     */
   public static void render(String templateName, WebContext ctx) throws IOException {
       ServletContextTemplateResolver resolver = new ServletContextTemplateResolver(ctx.getServletContext());
       resolver.setTemplateMode(TemplateMode.HTML);
       resolver.setPrefix("/WEB-INF/templates/");
       resolver.setSuffix(".html");
       resolver.setCacheable(true);
       resolver.setCacheTTLMs(60000L);
       resolver.setCharacterEncoding("utf-8");

       TemplateEngine engine = new TemplateEngine();
       engine.setTemplateResolver(resolver);

       engine.process(templateName, ctx, ctx.getResponse().getWriter());
   }

}
