Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F072A910
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 10:23:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BEA032040A; Sun, 26 May 2019 08:23:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 08:23:53 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A13C32040B
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 08:23:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bJDkvEGjiEU7 for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 08:23:42 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5A4E42040A
	for <nbd@other.debian.org>; Sun, 26 May 2019 08:23:42 +0000 (UTC)
Received: from [197.89.111.44] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hUoRP-0001St-Qv; Sun, 26 May 2019 10:23:40 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hUoRH-0001zu-7Z; Sun, 26 May 2019 10:23:31 +0200
Date: Sun, 26 May 2019 10:23:30 +0200
From: Wouter Verhelst <w@uter.be>
To: Xiubo Li <xiubli@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: One new nbd-runner project to support the Gluster/Ceph/Azure, etc
Message-ID: <20190526082330.GB6936@grep.be>
References: <6d10eff3-71d7-7174-d267-61e2a6fd1bc5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d10eff3-71d7-7174-d267-61e2a6fd1bc5@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ySq8uuxffqM.A.SwH.Z0k6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/522
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190526082330.GB6936@grep.be
Resent-Date: Sun, 26 May 2019 08:23:53 +0000 (UTC)

Hi Xiubo Li,

Sorry for not coming back to you about this yet. It was the first time
that someone asked for a repository under the NetworkBlockDevice
umbrella, and I wasn't sure how to handle it yet ;-)

My gut feeling is that this is not really a good fit for the
NetworkBlockDevice project space on github. Its purpose is to be a
gateway, rather than a standalone server; to me, that means it does not
really belong with the reference server etc.

That doesn't mean I don't want to link to your project; I do think it is
rather cool. But not as a repository in the NetworkBlockDevice umbrella.

Instead, I'm going to add a link on the README or some such.

Regards,

On Mon, Mar 25, 2019 at 09:01:30PM +0800, Xiubo Li wrote:
> Hi ALL,
> 
> The NBD is one great project :-)
> 
> Currently there are many Distributed Storages projects such as the Gluster and
> Ceph are widely use, but they couldn't support NBD directly. For example, for
> the Gluster, if we want to export the volume file as one NBD block device we
> must mount the volume first and then use the nbd utils to export it again,
> which a little ugly.
> 
> To make it more efficient, we also need one common and generic utils, something
> like [1], to support them directly. And good news is that I have a working code
> with most basic things @nbd-runner project[2]. It is hosted under the gluster/
> currently and I'd like to request a repository under [3] to host this.
> 
> Now the Gluster handler coding is done,  the Ceph and Azure is in progress now.
> 
> Thanks
> 
> Regards,
> Xiubo Li (@lxbsz)
> 
> [1] https://github.com/NetworkBlockDevice/nbd
> [2] https://github.com/gluster/nbd-runner
> [3] https://github.com/NetworkBlockDevice
> 
> 

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

