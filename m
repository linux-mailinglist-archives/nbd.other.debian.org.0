Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0244E5FF4
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 09:09:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D3861202E2; Thu, 24 Mar 2022 08:09:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 08:09:31 2022
Old-Return-Path: <BATV+3868aa8635b3ec16ad0d+6787+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4EC2F202D7
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 07:51:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4wPOOKYX4lG4 for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 07:51:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B7D09202CA
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=acBu3tCXyEDVeYAYV28iacN7Cu33sK9G4LGzMEiquog=; b=HufQcqfqkBCZUaJmBHctMBLkD+
	ed7UwenYXKVCxq6QLh5mNxavPdu4BQmrHFa2Kob/GDWXM6em9zGco2pfsk93pVslrb0T13SKIqvL4
	pje4lgYFiYcB/8JE5sImpt4XVXZZF3OnBQcPTsutCsNsjIzM1B1iJL5/hNlVAXeQdYsrXgjbyAnD5
	+2W3UlYJiIW4sRTYy+h50SR+hMyIjGpZhK8Ky/Po00sJ9MeGU333jhTwSXj7eoT3sEz5LQyh+eEjh
	sr3fyvvTSqD+/2I7XFQ/B2rzYUiwKzveK0MzHEXOw/E1uXomQbBNhmtIGedY3c1A2uRpOxqka0EO3
	UuDiz6yg==;
Received: from [2001:4bb8:19a:b822:f71:16c0:5841:924e] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXIFd-00FzTF-0X; Thu, 24 Mar 2022 07:51:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: yet another approach to fix the loop lock order inversions v4
Date: Thu, 24 Mar 2022 08:51:06 +0100
Message-Id: <20220324075119.1556334-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ufZI1McW5gL.A.nrG.7cCPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1753
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324075119.1556334-1-hch@lst.de
Resent-Date: Thu, 24 Mar 2022 08:09:31 +0000 (UTC)

Hi all,

this series uses the approach from Tetsuo to delay the destroy_workueue
call, extended by a delayed teardown of the workers to fix a potential
race window then the workqueue can be still round after finishing the
commands. 

Changes since v3:
 - change bd_openers into a atomic_t, including a bunch of cleanups
   and fix found while adding those

Changes since v2:
 - rebased to the lastest block for-next tree, which has the async
   clear reverted and ->free_disk
 - impkement ->free_disk for loop to handle open vs delete races
   more gracefully
 - get rid of lo_refcnt entirely

Changes since v1:
 - add comments to document the lo_refcnt synchronization
 - fix comment typos

