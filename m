Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF32A928
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 11:24:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8FC082012C; Sun, 26 May 2019 09:24:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 09:24:28 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4D5EC200CE
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 09:24:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3lFwaBECiRyd for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 09:24:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7C8AC20498
	for <nbd@other.debian.org>; Sun, 26 May 2019 09:24:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CA893082129;
	Sun, 26 May 2019 09:24:13 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 993A65C238;
	Sun, 26 May 2019 09:24:12 +0000 (UTC)
Date: Sun, 26 May 2019 10:24:11 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, eblake@redhat.com, nsoffer@redhat.com,
	berrange@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD
 URIs.
Message-ID: <20190526092411.GB9368@redhat.com>
References: <20190525170518.4799-1-rjones@redhat.com>
 <20190526081532.GA6936@grep.be>
 <20190526090018.GO9582@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526090018.GO9582@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sun, 26 May 2019 09:24:13 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <R_f2taqhdMF.A.P9B.Mtl6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/524
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190526092411.GB9368@redhat.com
Resent-Date: Sun, 26 May 2019 09:24:28 +0000 (UTC)

On Sun, May 26, 2019 at 10:00:18AM +0100, Richard W.M. Jones wrote:
> I intended to write a cover letter, got distracted while sending it
> and forgot ...
> 
> Anyway I was going to say:
> 
>  - There's no way to specify abstract Unix domain sockets.  Should
>    there be?  I'm not aware of any server that supports them.  Luckily
>    the common approach of using `@` at the beginning should work:
>    https://unix.stackexchange.com/questions/206386/what-does-the-symbol-denote-in-the-beginning-of-a-unix-domain-socket-path-in-l
> 
>  - As Wouter already picked up in his review, should we allow a
>    default Unix domain socket?  The corollary to this is: Should we
>    make the authority mandatory for TCP/IP sockets?  Are there
>    sensible defaults for the authority (localhost:10809 probably).
> 
>  - I notice that proto.md has a text symlink (proto.txt).  Would we
>    need one for url.txt -> url.md?

A few more things:

 - I wrote a libnbd implementation of NBD URIs last night:
   https://github.com/libguestfs/libnbd/commit/d2dfefcefdf64864acae7a75c30d3f54e9a63ea6
   Of course thisis based off the draft spec, but I can amend this
   implementation as we work towards a final spec.  One annoying thing
   is that libxml2 provides no support for parsing the query
   parameters, and doing it by hand in C is a PITA ...

 - libnbd supports `nbds+unix` (ie. require TLS over a Unix domain
   socket).  We use this for testing, and of course it's "useless" for
   real life, which is why I omitted it from the spec.  (QEMU doesn't
   support TLS over Unix domain sockets; nbd-server looks like it
   could support it, but I didn't test it).

 - On the subject of requiring TLS, I made `nbds` mean that TLS is
   required, while `nbd` means that TLS can be used opportunistically
   but is not required.  Not sure what people think about that.
   There's no "definitely don't use TLS" setting, but given we have
   observed a 10x slowdown when TLS is enabled on a Unix domain socket
   between libnbd & nbdkit[*] maybe there should be.

Rich.

[*] A slightly unrealistic test.  Most of the time is spent running
the ChaCha stream cipher, and the cost of that would be mostly hidden
by network latency if we were doing this over a TCP socket.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

