Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 594AFDB2D9
	for <lists+nbd@lfdr.de>; Thu, 17 Oct 2019 18:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 06BDD205C3; Thu, 17 Oct 2019 16:54:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 17 16:54:07 2019
Old-Return-Path: <ebiggers@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6640A205C3
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Oct 2019 16:36:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cqezaBpx7HEI for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Oct 2019 16:36:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6BE9C20583
	for <nbd@other.debian.org>; Thu, 17 Oct 2019 16:36:40 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4047E21835;
	Thu, 17 Oct 2019 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571330196;
	bh=Z/KBP2YLrD5Y/wfplASDyaw24GCH9LYbK0NX0ij4yFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRWfl0CF/fNtfLzCK9xoNX50b7918dQxGKCBhXclmgNbfprtOyU5vAVCyEDdHCPPN
	 1M/pOZ3Pb0zSTXB62LjUD/NfKWLBTOo9tKtHcNjObqoLiokmJ5AJ1R0I0MaSTBiomd
	 PO7rHmnCrOP9TbWUHpUJKS+tzEKaW1cYXlqziFIo=
Date: Thu, 17 Oct 2019 09:36:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Mike Christie <mchristi@redhat.com>,
	syzbot <syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com>,
	axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: INFO: task hung in nbd_ioctl
Message-ID: <20191017163634.GD726@sol.localdomain>
Mail-Followup-To: "Richard W.M. Jones" <rjones@redhat.com>,
	Mike Christie <mchristi@redhat.com>,
	syzbot <syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com>,
	axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	syzkaller-bugs@googlegroups.com
References: <000000000000b1b1ee0593cce78f@google.com>
 <5D93C2DD.10103@redhat.com>
 <20191017140330.GB25667@redhat.com>
 <5DA88D2F.7080907@redhat.com>
 <20191017162829.GA3888@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017162829.GA3888@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sF9pJhHk_hB.A.nuH.vyJqdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/710
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191017163634.GD726@sol.localdomain
Resent-Date: Thu, 17 Oct 2019 16:54:08 +0000 (UTC)

On Thu, Oct 17, 2019 at 05:28:29PM +0100, Richard W.M. Jones wrote:
> On Thu, Oct 17, 2019 at 10:47:59AM -0500, Mike Christie wrote:
> > On 10/17/2019 09:03 AM, Richard W.M. Jones wrote:
> > > On Tue, Oct 01, 2019 at 04:19:25PM -0500, Mike Christie wrote:
> > >> Hey Josef and nbd list,
> > >>
> > >> I had a question about if there are any socket family restrictions for nbd?
> > > 
> > > In normal circumstances, in userspace, the NBD protocol would only be
> > > used over AF_UNIX or AF_INET/AF_INET6.
> > > 
> > > There's a bit of confusion because netlink is used by nbd-client to
> > > configure the NBD device, setting things like block size and timeouts
> > > (instead of ioctl which is deprecated).  I think you don't mean this
> > > use of netlink?
> > 
> > I didn't. It looks like it is just a bad test.
> > 
> > For the automated test in this thread the test created a AF_NETLINK
> > socket and passed it into the NBD_SET_SOCK ioctl. That is what got used
> > for the NBD_DO_IT ioctl.
> > 
> > I was not sure if the test creator picked any old socket and it just
> > happened to pick one nbd never supported, or it was trying to simulate
> > sockets that did not support the shutdown method.
> > 
> > I attached the automated test that got run (test.c).
> 
> I'd say it sounds like a bad test, but I'm not familiar with syzkaller
> nor how / from where it generates these tests.  Did someone report a
> bug and then syzkaller wrote this test?
> 
> Rich.
> 
> > > 
> > >> The bug here is that some socket familys do not support the
> > >> sock->ops->shutdown callout, and when nbd calls kernel_sock_shutdown
> > >> their callout returns -EOPNOTSUPP. That then leaves recv_work stuck in
> > >> nbd_read_stat -> sock_xmit -> sock_recvmsg. My patch added a
> > >> flush_workqueue call, so for socket familys like AF_NETLINK in this bug
> > >> we hang like we see below.
> > >>
> > >> I can just remove the flush_workqueue call in that code path since it's
> > >> not needed there, but it leaves the original bug my patch was hitting
> > >> where we leave the recv_work running which can then result in leaked
> > >> resources, or possible use after free crashes and you still get the hang
> > >> if you remove the module.
> > >>
> > >> It looks like we have used kernel_sock_shutdown for a while so I thought
> > >> we might never have supported sockets that did not support the callout.
> > >> Is that correct? If so then I can just add a check for this in
> > >> nbd_add_socket and fix that bug too.
> > > 
> > > Rich.
> > > 

It's an automatically generated fuzz test.

There's rarely any such thing as a "bad" fuzz test.  If userspace can do
something that causes the kernel to crash or hang, it's a kernel bug, with very
few exceptions (e.g. like writing to /dev/mem).

If there are cases that aren't supported, like sockets that don't support a
certain function or whatever, then the code needs to check for those cases and
return an error, not hang the kernel.

- Eric

