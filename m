Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9533E260D6
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 11:56:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5C1F720560; Wed, 22 May 2019 09:56:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 09:56:02 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3F955204F8
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 09:55:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id omCpmYOPkNrE for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 09:55:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E0FDF204E6
	for <nbd@other.debian.org>; Wed, 22 May 2019 09:55:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E5723092667;
	Wed, 22 May 2019 09:55:46 +0000 (UTC)
Received: from localhost (ovpn-116-243.ams2.redhat.com [10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E49EE60557;
	Wed, 22 May 2019 09:55:44 +0000 (UTC)
Date: Wed, 22 May 2019 10:55:45 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: Re: Standard NBD URL syntax (again)
Message-ID: <20190522095545.GY9582@redhat.com>
References: <20190520092056.GA9368@redhat.com>
 <20190521203036.GA24332@grep.be>
 <20190521212701.GS9582@redhat.com>
 <20190522064220.GB24332@grep.be>
 <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 22 May 2019 09:55:46 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VX5hlChyeFJ.A.eT.yyR5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/509
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190522095545.GY9582@redhat.com
Resent-Date: Wed, 22 May 2019 09:56:02 +0000 (UTC)

So last night I had an important thought about this:

 * What existing export names are people using in real life?

nbdkit doesn't use export names for anything - you can pass
anything you like.

qemu-nbd has an odd system where the export name must match what was
specified on the command line, but AFAIK it doesn't care about it
otherwise.

qemu's internal NBD server may permit multiple export names, but I'm
not totally sure about that.  What do they look like?  Arbitrary
strings?  Absolute paths?  Relative paths?

nbd-server supports multiple export names, and it does appear to want
absolute paths.  Can it use arbitrary strings too, or are absolute
paths the only option?  How about relative paths?

Basically, I think what we most commonly use export names for should
influence how we decide to use them in URLs.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

