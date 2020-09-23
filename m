Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C3275E13
	for <lists+nbd@lfdr.de>; Wed, 23 Sep 2020 19:00:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 72E722053B; Wed, 23 Sep 2020 17:00:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 23 17:00:09 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E7F420532
	for <lists-other-nbd@bendel.debian.org>; Wed, 23 Sep 2020 16:44:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.13 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lV3PK7HQpr9P for <lists-other-nbd@bendel.debian.org>;
	Wed, 23 Sep 2020 16:44:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pf1-x443.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1894C20539
	for <nbd@other.debian.org>; Wed, 23 Sep 2020 16:44:02 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n14so15596pff.6
        for <nbd@other.debian.org>; Wed, 23 Sep 2020 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9kKVBm2QDcEhoI7VNH0u9uwqsgFbX84K7to4q+EvAF8=;
        b=wo1HxCm5bKIVa9so0OH72jUPeuxpy0gBmSztrnAMX5SSm8gqDsd/uDbJD7n0nTY7Hv
         CKJoObg/EBB1JCvStmCq+2DKeNopjuTxhY6T7yv5TlzOVOSgvtBEy4neG07it4ARoA4J
         WHOi+7obrEMIUDmzT3kBBEHLDf0ZbrbNxMoUwtAnQnNZ4qwV/A1Mq5PJhKVbgpJ/Rod5
         V4wdCnvNPJU0KSWHIs05KbU5DxoLhNDG93YaWxwBm6g7XccmnyHw+ixRtSpxeaSGMhwd
         mx1/GOsS6pG7kDo6kprXjUbJ/6H+1rzHGTrQ7trw2dp1Uk7jyzCH8F6put7clvS8xmh3
         DueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9kKVBm2QDcEhoI7VNH0u9uwqsgFbX84K7to4q+EvAF8=;
        b=F6m1jR8sqV0iufGpCgknzDsNEgO7+YvV+qYt+5yTYpNhHM9/l56w8B8T5HqL/8rzb4
         MB+jna6+JoQ/CWEUi4TcFyswIrvI5qvcfccwfSCdX7IMMomSNun/DMpU7c5spz2Vi+KG
         rz53p1p18fFILBkwbeereZ8aXe4psrqMvJv9sXHtXnO2TUyVs5Tc6PeLbc3ralUtMw+g
         NeY3og1PO1e/yPk23RtuBvmL4jD4Yv/gnC0hIduSY/6y0Opzo0HDfurkh3mDqgihXx6B
         Y5ZaQ+lYpAHfY60sIzJ8OqNE6pL/GkcvrCR4SMN3k/8akjzWKYAytWrhHsjAV7NWDp6T
         wpeQ==
X-Gm-Message-State: AOAM5306b8yWbcDcxr4GQQqPNBu7Pn+0cy28wPrxYu9BtD5ChD9RGg7L
	NQZfznJqcWudr251tX1o3ND1Zg==
X-Google-Smtp-Source: ABdhPJzQnxjNRw3M1n4lJU3pDIkemY3ZCQKnOQ7VywhFrMYRm0itMgYfj3gWdktm3tes58COiW8SXA==
X-Received: by 2002:a62:2b52:0:b029:142:2501:39e9 with SMTP id r79-20020a622b520000b0290142250139e9mr746426pfr.56.1600879439083;
        Wed, 23 Sep 2020 09:43:59 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id q190sm241046pfq.99.2020.09.23.09.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:43:58 -0700 (PDT)
Subject: Re: remove blkdev_get as a public API v2
To: Christoph Hellwig <hch@lst.de>
Cc: Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 linux-ide@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, linux-block@vger.kernel.org
References: <20200921071958.307589-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <d23e5bd4-4d69-f909-eb8b-10c489b67f8b@kernel.dk>
Date: Wed, 23 Sep 2020 10:43:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921071958.307589-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <is0mYiGbunG.A.M9B.Z83afB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1004
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d23e5bd4-4d69-f909-eb8b-10c489b67f8b@kernel.dk
Resent-Date: Wed, 23 Sep 2020 17:00:09 +0000 (UTC)

On 9/21/20 1:19 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series removes blkdev_get as a public API, leaving it as just an
> implementation detail of blkdev_get_by_path and blkdev_get_by_dev.  The
> reason for that is that blkdev_get is a very confusing API that requires
> a struct block_device to be fed in, but then actually consumes the
> reference.  And it turns out just using the two above mentioned APIs
> actually significantly simplifies the code as well.
> 
> Changes since v1:
>  - fix a mismerged that left a stray bdget_disk around
>  - factour the partition scan at registration time code into a new
>    helper.

Applied for 5.10, thanks.

-- 
Jens Axboe

