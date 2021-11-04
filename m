Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E96FE445136
	for <lists+nbd@lfdr.de>; Thu,  4 Nov 2021 10:33:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D3A5920657; Thu,  4 Nov 2021 09:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov  4 09:33:09 2021
Old-Return-Path: <BATV+9229d5203ea008eac577+6647+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CCD682064C
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 Nov 2021 09:16:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id e4otbI2g9dcg for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 Nov 2021 09:16:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1658 seconds by postgrey-1.36 at bendel; Thu, 04 Nov 2021 09:16:22 UTC
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C1E41205E5
	for <nbd@other.debian.org>; Thu,  4 Nov 2021 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9gP1LH3zvKAxABcAWtH7DhuMpE09FrjJbNcq52Qoyns=; b=VEicMkJmVu4TUtSAdkL2uU9Y1M
	H49HBUXnvi/DvDCoWd2Bd520qo68O1PxCcfwpkPK8V1OZBn3DAMPjLdnNNfzYszLjIIl884Gu65tH
	54kHzCy2KT/2YdrTfGoLtU7i395huQI/fJoyYmvnr1JB11gzEyX++ziBAoulmwMnKmbOIpiT9NB4L
	gOXmYWFIpL6GuLs/y/UG2imcsSste6LVP52vrRWdvjCDWNJZXgGd3kgS9GAByKChjdoO0enzxetoB
	4reePckn/6fVC10fXbfpWTciKYnyD0tnXUEsTi6bLyyI6BMqtkV6s1RQ8Y/G2N7o025+Y4pIKFTyY
	7z8VUWKg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miYQF-008MKw-9T; Thu, 04 Nov 2021 08:48:35 +0000
Date: Thu, 4 Nov 2021 01:48:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Wu Bo <wubo40@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	linfeilong@huawei.com
Subject: Re: [PATCH RESEND] nbd: code clean for nbd_genl_status()
Message-ID: <YYOeYwPlLnn7JR+W@infradead.org>
References: <1636000703-13217-1-git-send-email-wubo40@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636000703-13217-1-git-send-email-wubo40@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pqTw-NscHLB.A.Xs.Vj6ghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1610
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YYOeYwPlLnn7JR+W@infradead.org
Resent-Date: Thu,  4 Nov 2021 09:33:09 +0000 (UTC)

On Thu, Nov 04, 2021 at 12:38:23PM +0800, Wu Bo wrote:
>  	if (!reply_head) {
> -		nlmsg_free(reply);
>  		goto out;
>  	}

Please also drop the now pointless braces.

>  out:
> +	if (reply)
> +		nlmsg_free(reply);

Please just use a different label for just unlocking vs also freeing
the reply.

