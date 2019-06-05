Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794D362CB
	for <lists+nbd@lfdr.de>; Wed,  5 Jun 2019 19:36:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CFD262033F; Wed,  5 Jun 2019 17:36:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  5 17:36:08 2019
Old-Return-Path: <berrange@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FROM_EXCESS_BASE64,MDO_CABLE_TV3,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 78D4B20187
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Jun 2019 17:19:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.401 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FROM_EXCESS_BASE64=0.979, MDO_CABLE_TV3=0.5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FV3tnh3KIMsv for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Jun 2019 17:19:36 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C6FBE2015A
	for <nbd@other.debian.org>; Wed,  5 Jun 2019 17:19:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86CBA3082135;
	Wed,  5 Jun 2019 17:19:27 +0000 (UTC)
Received: from redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6CD546E3;
	Wed,  5 Jun 2019 17:19:23 +0000 (UTC)
Date: Wed, 5 Jun 2019 18:19:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, eblake@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190605171920.GB12691@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528103537.15081-2-rjones@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 05 Jun 2019 17:19:27 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3FcrBuTZ8XM.A.AmC.I2_9cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/561
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190605171920.GB12691@redhat.com
Resent-Date: Wed,  5 Jun 2019 17:36:08 +0000 (UTC)

On Tue, May 28, 2019 at 11:35:37AM +0100, Richard W.M. Jones wrote:
> For further information about discussion around this standard, see
> this thread on the mailing list:
> https://lists.debian.org/nbd/2019/05/msg00013.html
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  doc/Makefile.am |   2 +-
>  doc/uri.md      | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 184 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/Makefile.am b/doc/Makefile.am
> index 7f0284c..fa8a4b0 100644
> --- a/doc/Makefile.am
> +++ b/doc/Makefile.am
> @@ -1 +1 @@
> -EXTRA_DIST = README proto.md todo.txt
> +EXTRA_DIST = README proto.md todo.txt uri.md
> diff --git a/doc/uri.md b/doc/uri.md
> new file mode 100644
> index 0000000..0326c67
> --- /dev/null
> +++ b/doc/uri.md
> @@ -0,0 +1,183 @@

> +## NBD URI scheme
> +
> +One of the following scheme names SHOULD be used to indicate an NBD URI:
> +
> +* `nbd`: NBD over an unencrypted or opportunistically TLS encrypted
> +  TCP/IP connection.
> +
> +* `nbds`: NBD over a TLS encrypted TCP/IP connection.  If encryption
> +  cannot be negotiated then the connection MUST fail.
> +
> +* `nbd+unix`: NBD over a Unix domain socket.  The query parameters
> +  MUST include a parameter called `socket` which refers to the name of
> +  the Unix domain socket.

This should mention "nbds+unix", since it is valid to run TLS over a
UNIX socket to. This does have complications for x509 though, because
you then need to explicitly pass the hostname to validate the cert
against. For PSK it is trivial though.

The rationale for TLS over UNIX sockets, is that the UNIX socket may
simply be a local tunnel to the real TCP connection.

> +Other URI scheme names MAY be used but not all NBD clients will
> +understand them or even recognize that they refer to NBD.
> +
> +## NBD URI authority
> +
> +The authority field SHOULD be used for TCP/IP connections and SHOULD
> +NOT be used for Unix domain socket connections.
> +
> +The authority field MAY contain the `userinfo`, `host` and/or `port`
> +fields as defined in [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt)
> +section 3.2.
> +
> +The `host` field may be a host name or IP address.  Literal IPv6
> +addresses MUST be formatted in the way specified by
> +[RFC 2732](https://www.ietf.org/rfc/rfc2732.txt).
> +
> +If the `port` field is not present then it MUST default to the NBD
> +port number assigned by IANA (10809).
> +
> +The `userinfo` field is used to supply a username for TLS
> +authentication.  If the `userinfo` field is not present but is needed
> +by the client for TLS authentication then it SHOULD default to a local
> +operating system credential if one is available.

What do you mean by "TLS authentication" here ? This is the name used
to lookup the PSK credentials when the PSK file contains many creds ?

If so this probably needs explaining, since IIUC this use of many
PSK creds in one file is not really a TLS thing, it is an impl
choice of QEMU's PSK support.

Using the URI authority section for passing "userinfo" feels like a
bad idea though. Shouldn't we pass that as a parameter and keep the
authority as the normal "hostname" semantics, or unused if no hostname
is applicable.

> +It is up to the NBD client what should happen if the authority field
> +is not present for TCP/IP connections, or present for Unix domain
> +socket connections.  Options might include failing with an error,
> +ignoring it, or using defaults.
> +
> +## NBD URI export name
> +
> +The path part of the URI except for the leading `/` character MAY be
> +passed to the server as the export name.
> +
> +For example:
> +
> +    NBD URI                          Export name
> +    ----------------------------------------------------
> +    nbd://example.com/disk           disk
> +    nbd+unix:///disk                 disk
> +    nbd://example.com/               (empty string)
> +    nbd://example.com                (empty string)
> +    nbd://example.com//disk          /disk
> +    nbd://example.com/hello%20world  hello world
> +
> +Note that export names are not usually paths, they are free text
> +strings.  In particular they do not usually start with a `/`
> +character, they may be an empty string, and they may contain any
> +Unicode character.
> +
> +NBD servers MAY restrict the export names they are able to parse (for
> +example by only accepting 7 bit ASCII names).  The reader should refer
> +to the NBD protocol.
> +
> +## NBD URI socket parameter
> +
> +If the scheme name indicates a Unix domain socket then the query
> +parameters MUST include a `socket` key, referring to the Unix domain
> +socket which on Unix-like systems is usually a special file on the
> +local disk.
> +
> +On platforms which support Unix domain sockets in the abstract
> +namespace, and if the client supports this, the `socket` parameter MAY
> +begin with an ASCII NUL character.  When the URI is properly encoded
> +it will look like this:
> +
> +    nbd+unix:///?socket=%00/abstract

In the abstract namespace, the entire 108 characters are significant.
IOW, if you pass a 10 character abstract path you've got 98 NULs
implicitly following that. We should document this, as it is a
frequent interoperability screw up in apps to not take this into
account.


> +## NBD URI query parameters related to TLS
> +
> +If TLS encryption is to be negotiated then the following query
> +parameters MAY be present:
> +
> +* `tls-type`: Possible values include `anon`, `x509` or `psk`.  This
> +  specifies the desired TLS authentication method.  The client MAY
> +  default to an authentication method based on which other `tls-*`
> +  parameters are present.
> +
> +* `tls-certificates`: The path to the TLS certificates directory.
> +
> +* `tls-psk-file`: The path to the TLS-PSK key file.

In QEMU, we don't accept a path to the PSK file, we take a path to
a directory which contains "tls-creds-psk" and optionally also
a "dh-params.pem" file.

IOW, we just have a single "tls-creds-dir" parameter working the
same way for PSK and x509. All that differs is what files are
expected to be present.

So this spec conflicts with QEMU's view of managing TLS creds
files.

> +* `tls-hostname`: The TLS client hostname.

We should document how this relates to the hostname in the URI
authority. ie, if omitted the URI authority will be used instead.

> +* `tls-verify-peer`: This optional parameter may be `0` or `1` to
> +  control whether the client verifies the server's identity.  By
> +  default clients SHOULD verify the server's identity if TLS is
> +  negotiated and if a suitable Certificate Authorty is available.

I'd prefer if this is a "MUST" for the default value to be 1, if
omitted.

Implementing TLS without implementing verification is nonsensical
IMHO.

> +### TLS certificates directory
> +
> +The `tls-certificates` parameter (if used) refers to a directory
> +containing the Certificate Authority (CA) certificates bundle, client
> +certificate, client private key, and CA Certificate Revocation List.
> +
> +These are all optional except for the CA certificates bundle.
> +
> +The files in this directory SHOULD use the following names:
> +
> +    Filename               Usage
> +    --------------------------------------------------
> +    ca-cert.pem            CA certificates bundle
> +    client-cert.pem        Client certificate
> +    client-key.pem         Client private key
> +    ca-crl.pem             CA Certificate Revocation List

QEMU suports a "dh-params.pem" file for the diffie-hellman parameters.

With PSK, it uses a "tls-creds-psk" file with optional dh-params.pem
file too.

> +## Other NBD URI query parameters
> +
> +Other query parameters SHOULD be ignored by the parser.
> +
> +## Clients which do not support TLS
> +
> +Wherever this document refers to encryption, authentication and TLS,
> +clients which do not support TLS SHOULD give an error when
> +encountering an NBD URI that requires TLS (such as one with a scheme
> +name `nbds`).
> \ No newline at end of file


There ought to be a way to specify the TLS priority string to control
what valid cipher settings are.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

