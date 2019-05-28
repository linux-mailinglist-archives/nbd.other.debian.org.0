Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C001E2D98A
	for <lists+nbd@lfdr.de>; Wed, 29 May 2019 11:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8A73D20742; Wed, 29 May 2019 09:54:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 09:54:08 2019
Old-Return-Path: <yotta.liu@ucloud.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DATE_IN_PAST_12_24,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 42F0020734
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2019 09:38:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.931 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DATE_IN_PAST_12_24=1.049, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KyUI0IHOqqn4 for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2019 09:38:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 396 seconds by postgrey-1.36 at bendel; Wed, 29 May 2019 09:38:08 UTC
Received: from m9783.mail.qiye.163.com (m9783.mail.qiye.163.com [220.181.97.83])
	by bendel.debian.org (Postfix) with ESMTP id C8DEF20741
	for <nbd@other.debian.org>; Wed, 29 May 2019 09:38:08 +0000 (UTC)
Received: from localhost (unknown [120.132.1.243])
	by m9783.mail.qiye.163.com (Hmail) with ESMTPA id A1BD9C1A9B;
	Wed, 29 May 2019 17:31:24 +0800 (CST)
Date: Wed, 29 May 2019 03:04:46 +0800
From: Yao Liu <yotta.liu@ucloud.cn>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	nbd <nbd@other.debian.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] nbd: fix connection timed out error after
 reconnecting to server
Message-ID: <20190528190446.GA21513@192-168-150-246.7~>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <20190524130740.zfypc2j3q5e3gryr@MacBook-Pro-91.local.dhcp.thefacebook.com>
 <20190527180743.GA20702@192-168-150-246.7~>
 <20190528165758.zxfrv6fum4vwcv4e@MacBook-Pro-91.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528165758.zxfrv6fum4vwcv4e@MacBook-Pro-91.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-HM-Spam-Status: e1kIGBQJHllBWUtVQ01OQkJCQ0xMT05JQ05ZV1koWUFJQjdXWS1ZQUlXWQ
	kOFx4IWUFZNTQpNjo3JCkuNz5ZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAw6Hzo4Ezg3USJLOikVPU09
	OggaCRlVSlVKTk5CSklJSUNPQ05IVTMWGhIXVQIUDw8aVRcSDjsOGBcUDh9VGBVFWVdZEgtZQVlK
	SUtVSkhJVUpVSU9IWVdZCAFZQU5OSU43Bg++
X-HM-Tid: 0a6b02ee10a32085kuqya1bd9c1a9b
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UrFDvo8R1CF.A.chH.Abl7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/547
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190528190446.GA21513@192-168-150-246.7~
Resent-Date: Wed, 29 May 2019 09:54:08 +0000 (UTC)

On Tue, May 28, 2019 at 12:57:59PM -0400, Josef Bacik wrote:
> On Tue, May 28, 2019 at 02:07:43AM +0800, Yao Liu wrote:
> > On Fri, May 24, 2019 at 09:07:42AM -0400, Josef Bacik wrote:
> > > On Fri, May 24, 2019 at 05:43:54PM +0800, Yao Liu wrote:
> > > > Some I/O requests that have been sent succussfully but have not yet been
> > > > replied won't be resubmitted after reconnecting because of server restart,
> > > > so we add a list to track them.
> > > > 
> > > > Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
> > > 
> > > Nack, this is what the timeout stuff is supposed to handle.  The commands will
> > > timeout and we'll resubmit them if we have alive sockets.  Thanks,
> > > 
> > > Josef
> > > 
> > 
> > On the one hand, if num_connections == 1 and the only sock has dead,
> > then we do nbd_genl_reconfigure to reconnect within dead_conn_timeout,
> > nbd_xmit_timeout will not resubmit commands that have been sent
> > succussfully but have not yet been replied. The log is as follows:
> >  
> > [270551.108746] block nbd0: Receive control failed (result -104)
> > [270551.108747] block nbd0: Send control failed (result -32)
> > [270551.108750] block nbd0: Request send failed, requeueing
> > [270551.116207] block nbd0: Attempted send on invalid socket
> > [270556.119584] block nbd0: reconnected socket
> > [270581.161751] block nbd0: Connection timed out
> > [270581.165038] block nbd0: shutting down sockets
> > [270581.165041] print_req_error: I/O error, dev nbd0, sector 5123224 flags 8801
> > [270581.165149] print_req_error: I/O error, dev nbd0, sector 5123232 flags 8801
> > [270581.165580] block nbd0: Connection timed out
> > [270581.165587] print_req_error: I/O error, dev nbd0, sector 844680 flags 8801
> > [270581.166184] print_req_error: I/O error, dev nbd0, sector 5123240 flags 8801
> > [270581.166554] block nbd0: Connection timed out
> > [270581.166576] print_req_error: I/O error, dev nbd0, sector 844688 flags 8801
> > [270581.167124] print_req_error: I/O error, dev nbd0, sector 5123248 flags 8801
> > [270581.167590] block nbd0: Connection timed out
> > [270581.167597] print_req_error: I/O error, dev nbd0, sector 844696 flags 8801
> > [270581.168021] print_req_error: I/O error, dev nbd0, sector 5123256 flags 8801
> > [270581.168487] block nbd0: Connection timed out
> > [270581.168493] print_req_error: I/O error, dev nbd0, sector 844704 flags 8801
> > [270581.170183] print_req_error: I/O error, dev nbd0, sector 5123264 flags 8801
> > [270581.170540] block nbd0: Connection timed out
> > [270581.173333] block nbd0: Connection timed out
> > [270581.173728] block nbd0: Connection timed out
> > [270581.174135] block nbd0: Connection timed out
> >  
> > On the other hand, if we wait nbd_xmit_timeout to handle resubmission,
> > the I/O requests will have a big delay. For example, if timeout time is 30s,
> > and from sock dead to nbd_genl_reconfigure returned OK we only spend
> > 2s, the I/O requests will still be handled by nbd_xmit_timeout after 30s.
> 
> We have to wait for the full timeout anyway to know that the socket went down,
> so it'll be re-submitted right away and then we'll wait on the new connection.
> 
> Now we could definitely have requests that were submitted well after the first
> thing that failed, so their timeout would be longer than simply retrying them,
> but we have no idea of knowing which ones timed out and which ones didn't.  This
> way lies pain, because we have to matchup tags with handles.  This is why we
> rely on the generic timeout infrastructure, so everything is handled correctly
> without ending up with duplicate submissions/replies.  Thanks,
> 
> Josef
> 

But as I mentioned before, if num_connections == 1, nbd_xmit_timeout won't re-submit
commands and I/O error will occur. Should we change the condition
		if (config->num_connections > 1)
to
		if (config->num_connections >= 1)
?

