Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30E36F95
	for <lists+nbd@lfdr.de>; Thu,  6 Jun 2019 11:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E4BC0202F6; Thu,  6 Jun 2019 09:12:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  6 09:12:08 2019
Old-Return-Path: <berrange@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=4.0 tests=FOURLA,FROM_EXCESS_BASE64,
	MDO_CABLE_TV3,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F1427201D5
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Jun 2019 08:55:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.401 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_EXCESS_BASE64=0.979,
	MDO_CABLE_TV3=0.5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id i9dLoxvx3WbF for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Jun 2019 08:55:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 37A43201B4
	for <nbd@other.debian.org>; Thu,  6 Jun 2019 08:55:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E3A630BBE69;
	Thu,  6 Jun 2019 08:55:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C974D70F;
	Thu,  6 Jun 2019 08:55:43 +0000 (UTC)
Date: Thu, 6 Jun 2019 09:55:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
	w@uter.be, mkletzan@redhat.com
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190606085540.GA14300@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
 <20190605171920.GB12691@redhat.com>
 <3b439521-a1c9-5409-9694-31d50e048dd7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b439521-a1c9-5409-9694-31d50e048dd7@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 06 Jun 2019 08:55:45 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_r1h4jxyr3L.A.jBF.ojN-cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/563
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190606085540.GA14300@redhat.com
Resent-Date: Thu,  6 Jun 2019 09:12:08 +0000 (UTC)

On Wed, Jun 05, 2019 at 01:27:48PM -0500, Eric Blake wrote:
> On 6/5/19 12:19 PM, Daniel P. Berrangé wrote:
> > On Tue, May 28, 2019 at 11:35:37AM +0100, Richard W.M. Jones wrote:
> >> For further information about discussion around this standard, see
> >> this thread on the mailing list:
> >> https://lists.debian.org/nbd/2019/05/msg00013.html
> >>
> 
> > 
> >> +## NBD URI scheme
> >> +
> >> +One of the following scheme names SHOULD be used to indicate an NBD URI:
> >> +
> >> +* `nbd`: NBD over an unencrypted or opportunistically TLS encrypted
> >> +  TCP/IP connection.
> >> +
> >> +* `nbds`: NBD over a TLS encrypted TCP/IP connection.  If encryption
> >> +  cannot be negotiated then the connection MUST fail.
> >> +
> >> +* `nbd+unix`: NBD over a Unix domain socket.  The query parameters
> >> +  MUST include a parameter called `socket` which refers to the name of
> >> +  the Unix domain socket.
> > 
> > This should mention "nbds+unix", since it is valid to run TLS over a
> > UNIX socket to. This does have complications for x509 though, because
> > you then need to explicitly pass the hostname to validate the cert
> > against. For PSK it is trivial though.
> > 
> > The rationale for TLS over UNIX sockets, is that the UNIX socket may
> > simply be a local tunnel to the real TCP connection.
> 
> qemu-nbd does not yet support TLS over Unix, but bringing it into line
> with what we document here should fill in that gap.
> 
> >> +## NBD URI authority
> >> +
> >> +The authority field SHOULD be used for TCP/IP connections and SHOULD
> >> +NOT be used for Unix domain socket connections.
> >> +
> >> +The authority field MAY contain the `userinfo`, `host` and/or `port`
> >> +fields as defined in [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt)
> >> +section 3.2.
> >> +
> >> +The `host` field may be a host name or IP address.  Literal IPv6
> >> +addresses MUST be formatted in the way specified by
> >> +[RFC 2732](https://www.ietf.org/rfc/rfc2732.txt).
> >> +
> >> +If the `port` field is not present then it MUST default to the NBD
> >> +port number assigned by IANA (10809).
> >> +
> >> +The `userinfo` field is used to supply a username for TLS
> >> +authentication.  If the `userinfo` field is not present but is needed
> >> +by the client for TLS authentication then it SHOULD default to a local
> >> +operating system credential if one is available.
> > 
> > What do you mean by "TLS authentication" here ? This is the name used
> > to lookup the PSK credentials when the PSK file contains many creds ?
> > 
> > If so this probably needs explaining, since IIUC this use of many
> > PSK creds in one file is not really a TLS thing, it is an impl
> > choice of QEMU's PSK support.
> > 
> > Using the URI authority section for passing "userinfo" feels like a
> > bad idea though. Shouldn't we pass that as a parameter and keep the
> > authority as the normal "hostname" semantics, or unused if no hostname
> > is applicable.
> 
> If I'm understanding the intent, this is a difference between:
> 
> nbds://user@host/exportname
> nbd+unix://user@/exportname?socket=path
> 
> vs.
> 
> nbds://host/exportname?tls_username=user
> nbd+unix:///exportname?socket=path&tls_username=user
> 
> I don't have a strong preference at the moment.

Actually ignore my comment here. I was misreading the text above
as saying that the hostname part should be interpreted as a username,
which is obviously wrong.

> >> +It is up to the NBD client what should happen if the authority field
> >> +is not present for TCP/IP connections, or present for Unix domain
> >> +socket connections.  Options might include failing with an error,
> >> +ignoring it, or using defaults.
> 
> The userinfo field is part of the authority; so this is
> self-contradictory if we want nbds+unix://username@/ for specifying the
> tls username.

Yeah, ignore my comment.

> 
> 
> >> +
> >> +On platforms which support Unix domain sockets in the abstract
> >> +namespace, and if the client supports this, the `socket` parameter MAY
> >> +begin with an ASCII NUL character.  When the URI is properly encoded
> >> +it will look like this:
> >> +
> >> +    nbd+unix:///?socket=%00/abstract
> > 
> > In the abstract namespace, the entire 108 characters are significant.
> > IOW, if you pass a 10 character abstract path you've got 98 NULs
> > implicitly following that. We should document this, as it is a
> > frequent interoperability screw up in apps to not take this into
> > account.
> 
> Does the Linux kernel treat:
> 
> "\0a" length 2
> "\0a\0...\0" length 108
> 
> as the same socket? If specifying an explicit shorter length has the
> same effect as providing explicit NUL bytes in the padding of a longer
> length, that's a little easier, but yes, documenting that any trailing
> bytes must be initialized to 0 is worthwhile.

I thought it did, but after testing, I can confirm they are different.

$ netstat -a -n -x -p | grep './unix-demo'
unix  2      [ ]         STREAM                   638293   15094/./unix-demo           @a
unix  2      [ ]         STREAM                   638292   15094/./unix-demo           @a@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

IOW, if users want padding, they must specify the URI encoded
trailing NULs.

I would note that QEMU is not able to support abstract sockets
right now & it isn't easy to add this if the path contains
real NULs. In QAPI it uses 'str' which assumes NUL-terminated
string with no embedded NULs. The sockets code liberally
uses strlen() too.  A common "hack" is to use "@" in place of
a real NUL, though that makes life confusing if you want a
real "@".

> 
> >> +If TLS encryption is to be negotiated then the following query
> >> +parameters MAY be present:
> >> +
> >> +* `tls-type`: Possible values include `anon`, `x509` or `psk`.  This
> >> +  specifies the desired TLS authentication method.  The client MAY
> >> +  default to an authentication method based on which other `tls-*`
> >> +  parameters are present.
> >> +
> >> +* `tls-certificates`: The path to the TLS certificates directory.
> >> +
> >> +* `tls-psk-file`: The path to the TLS-PSK key file.
> > 
> > In QEMU, we don't accept a path to the PSK file, we take a path to
> > a directory which contains "tls-creds-psk" and optionally also
> > a "dh-params.pem" file.
> > 
> > IOW, we just have a single "tls-creds-dir" parameter working the
> > same way for PSK and x509. All that differs is what files are
> > expected to be present.
> > 
> > So this spec conflicts with QEMU's view of managing TLS creds
> > files.
> 
> We could, of course, teach qemu to support whatever this spec ends up
> with in addition to everything else; but there's also the point that the
> qemu code uses a consistent model for TLS across multiple entities (not
> just NBD, but also Spice, chardevs, ...), and then there's the question
> of whether a compatibility hack should be global to all of them or just
> to the NBD code.
> 
> > 
> >> +* `tls-hostname`: The TLS client hostname.
> > 
> > We should document how this relates to the hostname in the URI
> > authority. ie, if omitted the URI authority will be used instead.
> 
> If a Unix socket is using TLS, would we allow URI authority there?

We could allow either.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

