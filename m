Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E52A91E
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 11:00:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 314FC204B9; Sun, 26 May 2019 09:00:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 09:00:35 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE5F9204B7
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 09:00:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XOCTRwK1xvw9 for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 09:00:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1915320462
	for <nbd@other.debian.org>; Sun, 26 May 2019 09:00:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76691307D914;
	Sun, 26 May 2019 09:00:19 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B8FA5D704;
	Sun, 26 May 2019 09:00:18 +0000 (UTC)
Date: Sun, 26 May 2019 10:00:18 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, eblake@redhat.com, nsoffer@redhat.com,
	berrange@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD
 URIs.
Message-ID: <20190526090018.GO9582@redhat.com>
References: <20190525170518.4799-1-rjones@redhat.com>
 <20190526081532.GA6936@grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526081532.GA6936@grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sun, 26 May 2019 09:00:19 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e20Au2nK0MK.A.KoE.zWl6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/523
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190526090018.GO9582@redhat.com
Resent-Date: Sun, 26 May 2019 09:00:35 +0000 (UTC)

I intended to write a cover letter, got distracted while sending it
and forgot ...

Anyway I was going to say:

 - There's no way to specify abstract Unix domain sockets.  Should
   there be?  I'm not aware of any server that supports them.  Luckily
   the common approach of using `@` at the beginning should work:
   https://unix.stackexchange.com/questions/206386/what-does-the-symbol-denote-in-the-beginning-of-a-unix-domain-socket-path-in-l

 - As Wouter already picked up in his review, should we allow a
   default Unix domain socket?  The corollary to this is: Should we
   make the authority mandatory for TCP/IP sockets?  Are there
   sensible defaults for the authority (localhost:10809 probably).

 - I notice that proto.md has a text symlink (proto.txt).  Would we
   need one for url.txt -> url.md?

Wouter Verhelst wrote:
> Should we perhaps also add query parameters for certificate-based
> authentication?

I think yes, although it could get complicated to define them all.

qemu's NBD client needs a directory name, which contains certificates
with particular names (see Dan's second example here:
https://www.berrange.com/posts/2016/04/05/improving-qemu-security-part-5-tls-support-for-nbd-server-client/
).  If we were to specify every file by name then it would require
probably 3 or 4 extra parameters (CA cert, client cert, client private
key file, and optionally revocation list).

For TLS-PSK it only needs the path to the PSK key file.  The username
is already provided in the userinfo authority field.

We might also consider a tls type parameter to switch between X.509
certs, PSK and anon.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

