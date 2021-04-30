package com.sirius.domain.controller.util;

import com.aspose.pdf.Document;
import com.aspose.pdf.HtmlLoadOptions;
import com.aspose.pdf.SaveFormat;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.docx4j.convert.in.xhtml.FormattingOption;
import org.docx4j.jaxb.Context;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.convert.in.xhtml.*;
import org.docx4j.openpackaging.exceptions.InvalidFormatException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.NumberingDefinitionsPart;
import org.docx4j.wml.RFonts;
import org.springframework.http.MediaType;

import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import org.docx4j.convert.in.xhtml.XHTMLImporter;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.PropertyException;
import javax.xml.transform.Source;

public class FileTypeConverter {

    String html;
    String fileExtension;

    public FileTypeConverter(String html, String fileExtension) {
        this.html = html;
        this.fileExtension = fileExtension;
    }

    public byte[] convert() {
        // Create HTML load options
        HtmlLoadOptions htmlOptions = new HtmlLoadOptions();
        // Create in and out memory streams.
        InputStream inHtmlStream = new ByteArrayInputStream(this.html.getBytes(StandardCharsets.UTF_8));
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        // Chose file type
        if(getSaveFormat() == SaveFormat.Pdf){
            // HTML file to PDF
            Document doc = new Document(inHtmlStream, htmlOptions);
            try {
                inHtmlStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            // Save file to doc
            doc.save(outStream, getSaveFormat());
        }

        if(getSaveFormat() == SaveFormat.Html){
            // HTML file
            try {
                inHtmlStream.transferTo(outStream);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if(getSaveFormat() == SaveFormat.Doc || getSaveFormat() == SaveFormat.DocX){
            WordprocessingMLPackage wordMLPackage = null;
            try {
                wordMLPackage = WordprocessingMLPackage.createPackage();
            } catch (InvalidFormatException e) {
                e.printStackTrace();
            }

            NumberingDefinitionsPart ndp = null;
            try {
                ndp = new NumberingDefinitionsPart();
            } catch (InvalidFormatException e) {
                e.printStackTrace();
            }
            try {
                wordMLPackage.getMainDocumentPart().addTargetPart(ndp);
            } catch (InvalidFormatException e) {
                e.printStackTrace();
            }
            try {
                ndp.unmarshalDefaultNumbering();
            } catch (JAXBException e) {
                e.printStackTrace();
            }

            XHTMLImporterImpl xHTMLImporter = new XHTMLImporterImpl(wordMLPackage);
            xHTMLImporter.setHyperlinkStyle("Hyperlink");

            // Convert the XHTML, and add it into the empty docx we made
            try {
                wordMLPackage.getMainDocumentPart().getContent().addAll(
                        xHTMLImporter.convert(inHtmlStream, null));
            } catch (Docx4JException e) {
                e.printStackTrace();
            }


            try {
                wordMLPackage.save(outStream);
            } catch (Docx4JException e) {
                e.printStackTrace();
            }

        }
        try {
            outStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // Convert ot to byte array and send it as ResponseEntity
        byte[] content = outStream.toByteArray();

        return content;
    }

    public byte[] convert(Object data) throws JAXBException, JsonProcessingException {
        // Create in and out memory streams.
        InputStream inHtmlStream = new ByteArrayInputStream(this.html.getBytes(StandardCharsets.UTF_8));
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();

        if(getSaveFormat() == SaveFormat.Xml){
            // XML file
            JAXBContext contextObj = JAXBContext.newInstance(data.getClass());

            Marshaller marshallerObj = contextObj.createMarshaller();
            marshallerObj.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

            marshallerObj.marshal(data, outStream);
        }

        if(getSaveFormat() == 17){
            // JSON file
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            String json = ow.writeValueAsString(data);
        }
        // Convert ot to byte array and send it as ResponseEntity
        byte[] content = outStream.toByteArray();

        return content;
    }

    public MediaType getMIME() {
        switch(fileExtension) {
            case "pdf":
                return MediaType.APPLICATION_PDF;
            case "doc":
                return MediaType.valueOf("application/msword");
            case "docx":
                return MediaType.valueOf("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
            case "xml":
                return MediaType.APPLICATION_XML;
            case "html":
                return MediaType.APPLICATION_XHTML_XML;
            case "png":
                return MediaType.IMAGE_PNG;
            case "jpg":
                return MediaType.IMAGE_JPEG;
            case "txt":
                return MediaType.TEXT_PLAIN;
            case "json":
                return MediaType.APPLICATION_JSON;
            default:
               return MediaType.ALL;
                // code block
        }
    }

    private Integer getSaveFormat(){
        switch(fileExtension) {
            case "pdf":
                return SaveFormat.Pdf;
            case "doc":
                return SaveFormat.Doc;
            case "docx":
                return SaveFormat.DocX;
            case "xml":
                return SaveFormat.Xml;
            case "html":
                return SaveFormat.Html;
            case "png":
                return SaveFormat.None;
            case "jpg":
                return SaveFormat.None;
            case "txt":
                return SaveFormat.TeX;
            case "json":
                return 17;
            default:
                return SaveFormat.None;
            // code block
        }
    }
}
