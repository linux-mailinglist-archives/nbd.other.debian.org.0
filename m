Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3432A95B
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 13:16:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7142D204B1; Sun, 26 May 2019 11:16:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 11:16:09 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6718E204AF
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 11:16:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BmYn0ml5lSeR for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 11:15:58 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4013C203A2
	for <nbd@other.debian.org>; Sun, 26 May 2019 11:15:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA6993082129;
	Sun, 26 May 2019 11:15:54 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F0936134C;
	Sun, 26 May 2019 11:15:54 +0000 (UTC)
Date: Sun, 26 May 2019 12:15:53 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, eblake@redhat.com, nsoffer@redhat.com,
	berrange@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD
 URIs.
Message-ID: <20190526111553.GC9368@redhat.com>
References: <20190525170518.4799-1-rjones@redhat.com>
 <20190526081532.GA6936@grep.be>
 <20190526090018.GO9582@redhat.com>
 <20190526092411.GB9368@redhat.com>
 <20190526102536.GD6936@grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526102536.GD6936@grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sun, 26 May 2019 11:15:54 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <X5XYLD9qNcJ.A.JfF.5Vn6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/528
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190526111553.GC9368@redhat.com
Resent-Date: Sun, 26 May 2019 11:16:09 +0000 (UTC)

On Sun, May 26, 2019 at 12:25:36PM +0200, Wouter Verhelst wrote:
> Why would you ever forbid using TLS in a URL? That seems silly.

Well my guess would be that you want maximum performance and have some
kind of private/airgapped network so TLS gets in the way.

I'm certainly not saying TLS is a bad thing, it's one of the great
selling points of the newstyle protocol and we support it in both
nbdkit & libnbd and routinely test TLS interop with the other servers.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

