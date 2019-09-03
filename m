Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B56A6BE7
	for <lists+nbd@lfdr.de>; Tue,  3 Sep 2019 16:53:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E32BE201BF; Tue,  3 Sep 2019 14:53:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  3 14:53:00 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 73BB92015A
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Sep 2019 14:52:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DJr5togOt087 for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Sep 2019 14:52:49 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E6AE320207
	for <nbd@other.debian.org>; Tue,  3 Sep 2019 14:52:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87FD318C8919;
	Tue,  3 Sep 2019 14:52:45 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CDD25D9E1;
	Tue,  3 Sep 2019 14:52:45 +0000 (UTC)
Date: Tue, 3 Sep 2019 15:52:44 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, berrange@redhat.com,
	mkletzan@redhat.com
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190903145244.GI3888@redhat.com>
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
 <27a64c91-7309-31d7-b639-b32e1107c3f5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27a64c91-7309-31d7-b639-b32e1107c3f5@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Tue, 03 Sep 2019 14:52:45 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IZ2mQvDY7cL.A.3BB.M5nbdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/679
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190903145244.GI3888@redhat.com
Resent-Date: Tue,  3 Sep 2019 14:53:00 +0000 (UTC)

On Tue, Sep 03, 2019 at 09:42:05AM -0500, Eric Blake wrote:
> On 6/11/19 6:53 AM, Richard W.M. Jones wrote:
> > For further information about discussion around this standard, see
> > this thread on the mailing list:
> > https://lists.debian.org/nbd/2019/05/msg00013.html
> > 
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > ---
> >  doc/Makefile.am |   2 +-
> >  doc/uri.md      | 171 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 172 insertions(+), 1 deletion(-)
> 
> Are we ready to commit this?  There were some discussions about whether
> to recognize/reserve any additional query parameters, but consensus
> seemed to be that was just over-engineering at this point.

This has been on my to-do for too long.  I think we really should drop
all the tls parameter stuff to keep it simple (can add it back later
of course).

I'll share the current commit with you in a moment and you can
run with it if you have time.

Rich.

> > +++ b/doc/uri.md
> 
> > +Note that export names are not usually paths, they are free text
> > +strings.  In particular they do not usually start with a `/`
> > +character, they may be an empty string, and they may contain any
> > +Unicode character.
> 
> Well, not the NUL character.
> 
> Do we need to worry about normalization issues?  That is, a server with
> an export named 'a//b/../c' might be normalized by URI parsers into
> 'a/c'.   Maybe we should adjust the NBD spec to recommend against the
> use of export names that could be altered during traditional file name
> normalization?
> 
> 
> > +## NBD URI query parameters related to TLS
> > +
> > +If TLS encryption is to be negotiated then the following query
> > +parameters MAY be present:
> > +
> > +* `tls-type`: Possible values include `anon`, `x509` or `psk`.  This
> > +  specifies the desired TLS authentication method.
> > +
> > +* `tls-hostname`: The optional TLS hostname to use for certificate
> > +  verification.  This can be used when connecting over a Unix domain
> > +  socket since there is no hostname available in the URI authority
> > +  field; or when DNS does not properly resolve the server's hostname.
> > +
> > +* `tls-verify-peer`: This optional parameter may be `0` or `1` to
> > +  control whether the client verifies the server's identity.  By
> > +  default clients SHOULD verify the server's identity if TLS is
> > +  negotiated and if a suitable Certificate Authorty is available.
> 
> Authority
> 
> > +
> > +## Other NBD URI query parameters
> > +
> > +Clients SHOULD prefix experimental query parameters using `x-`.  This
> > +SHOULD NOT be used for query parameters which are expected to be
> > +widely used.
> > +
> > +Any other query parameters which the client does not understand SHOULD
> > +be ignored by the parser.
> > +
> > +## Clients which do not support TLS
> > +
> > +Wherever this document refers to encryption, authentication and TLS,
> > +clients which do not support TLS SHOULD give an error when
> > +encountering an NBD URI that requires TLS (such as one with a scheme
> > +name `nbds` or `nbds+unix`).
> > 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
> 




-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/

