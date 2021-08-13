Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB93EB758
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 17:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 97E9920418; Fri, 13 Aug 2021 15:03:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 15:03:20 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 141A520402
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 14:48:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id P8kewkXLnKnu for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 14:47:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x832.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3757B203B2
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 14:47:53 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id d2so8422791qto.6
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GKeWoaPop4bRlZkqIVTlOnU0AzdsWpY1hkmifxUqH2I=;
        b=dvY57rZ2ay1Ind9SwLjZSU42PXOjI0r+tpUwsZz5s7TTpe3/qLJ7KNp8v4W1KK0AZi
         4FKOMkJ7bNGjIVV/Vz7NLp29JBlReyIE+C6gzNj5Mzpc0ExzBxN8IFb/HR2spXDIf3hY
         qpz9o03LIh8XzAzqdKyf/Ux+XBasbk8bhehGGxbBxYy7Zj/gU3AcF2s7ovRSluHOXp3g
         MnBntFLDjAda5CDD9fesiPnAOboqgI/xndYoGLmZOEPTrEpJA6omGagl5PxAyPG9cbGI
         0WMjosoj2AkW02huUK9C6jD913EK2Q2Jkl6uBPxsiuEJiP7FLip3ubcnoP6ncuaqqabv
         vFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GKeWoaPop4bRlZkqIVTlOnU0AzdsWpY1hkmifxUqH2I=;
        b=oALx6I2rkzulYvpmf1TkU3jdkFOqMHUkkRUN0gxmMmMAc5xDfEZ72rl907S8uMVy3s
         JbQDtlS2hM+jtFsNB+B6nUK5LqjXAlJpmf2LM6WVjqSYp69yzqElcKV6v1QBGUhHibpD
         SEhwOMle98NbFkSHoGSWW+Y28rMSLAnWn18BT+miCAfL6jA+2ncsIUKMmDLODQxHYr4T
         W994PKck4y+4/wd9WpoRyNDqbrCRxSq+AZBiztkYJEOb7RvbVHAW1HsPozwbM5PzOq/9
         BXfjz9eF81SLnNRevm3irgaCK89koMVSDkumrPLOfH25Qy9mIKirZmWBXDRBQCGTGiaF
         UEZw==
X-Gm-Message-State: AOAM531YvUGgMCZqA70gTashR8RxNhcIOXxfhg3ba4mgGaP0rDsCVrxc
	5HYDwXFXZu9O4cVgIAVLCU0osw==
X-Google-Smtp-Source: ABdhPJw/nmqHv7Crg0W/3S8MPU6GEvlrTs7iRDpEiNoXDp/eIFbce7LQJ7K/MC+eETxw0gOSjEQmgQ==
X-Received: by 2002:ac8:5bd6:: with SMTP id b22mr2339286qtb.193.1628866070464;
        Fri, 13 Aug 2021 07:47:50 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id d68sm1094444qke.19.2021.08.13.07.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 07:47:49 -0700 (PDT)
Subject: Re: nbd locking fixups
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Tao <houtao1@huawei.com>
References: <20210811124428.2368491-1-hch@lst.de>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <be8b98c3-0b39-7be7-4d9a-b1f5c2f0a54f@toxicpanda.com>
Date: Fri, 13 Aug 2021 10:47:46 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NHpFbDag2HC.A.tQC.4moFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1282
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/be8b98c3-0b39-7be7-4d9a-b1f5c2f0a54f@toxicpanda.com
Resent-Date: Fri, 13 Aug 2021 15:03:20 +0000 (UTC)

On 8/11/21 8:44 AM, Christoph Hellwig wrote:
> Hi Josef and Jens,
> 
> this series fixed the lock order reversal that is showing up with
> nbd lately.  The first patch contains the asynchronous deletion
> from Hou which is needed as a baseline.
> 

Other than the whitespace thing everything looks good, you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

