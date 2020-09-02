Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4951625ACC4
	for <lists+nbd@lfdr.de>; Wed,  2 Sep 2020 16:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 299C520445; Wed,  2 Sep 2020 14:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  2 14:18:09 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 718F9204A5
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Sep 2020 14:02:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ER4PR0ULgwRh for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Sep 2020 14:02:55 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd32.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1D799204AA
	for <nbd@other.debian.org>; Wed,  2 Sep 2020 14:02:54 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id m17so4052402ioo.1
        for <nbd@other.debian.org>; Wed, 02 Sep 2020 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ku7e+DesYlsL/c7k5HJw65rc3jrpfmGqzPu51jyJxJY=;
        b=DEE5OKKGh1r8VHsSbRDOHXyr0EY/JZmo9R9NjqSjJKawRaCP4hU7gd7TYcJP/9YZM7
         f9ePonEEbp/l91A6T4zFQxTQLDeZxmy0LMYDoRrMahsz8WSo30cFpFYAnwscMWxFdIlp
         oD8CXLDbgxFmE3UimYbtHYWaCjvm1HLjDP1Jf/oc196Q0dgg3xrDzjQ3BN32QyrfzGEu
         BAA+ZfhsIf58ZQsISLcJD7bVqjEF28U7NRblbSxZYn9AOlHAjsBMyhDBaU/uxguqX2OT
         X2fZVbjEQa6505uyiqaXXm9chdV79wx7RHjRntV/V2w1d3oytjJ926JWuLbQ8ZonRWBw
         7Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ku7e+DesYlsL/c7k5HJw65rc3jrpfmGqzPu51jyJxJY=;
        b=sueJnCUE8pQnsGuQOssiAlMMqiFuwHeIBN3GwK80crWcSIsvAx7Gf+qDaaHTB7ST6g
         iH09AoHgWUiJgDG04OnpgANKKZs3kuM3qR1msOqnUL2i1E4kAP0oOfOJ803zbac7reFO
         tU9kt7XW7zv/Nsb/OJ/oVc/JCwgx4P1x5UVNMzJQm+JMgB3B7meFOKn8xSQRdbdnw9aa
         yJ0jY1yiPF9Ne5J/arHkyIfzuOUytVlId/shMHqBTd5WQ/2Fywe5y98+WSKM6J+MAlvd
         xdNJBENrbwuts5ai5WsZJnMdF57e2DYwkBtffNinXmh1uEuhFVt7pDfEAVZI5daChdBM
         n+pw==
X-Gm-Message-State: AOAM533mhOcih//VCAWN6vNuBFcRXnyiwRnZjQie5PXnO+jqjsW/yLPg
	D1WOnHUzHVz8r879oX0pDjVQxw==
X-Google-Smtp-Source: ABdhPJxFrZXWesZv0xLmVsuUB1MDZ450c11yMQmgXL3dPEcVh+WgJjGeEIGPOaG+O49/dxLkaoYMdQ==
X-Received: by 2002:a05:6602:2043:: with SMTP id z3mr3472576iod.93.1599055371125;
        Wed, 02 Sep 2020 07:02:51 -0700 (PDT)
Received: from [192.168.1.57] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id s10sm616030ilo.53.2020.09.02.07.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 07:02:50 -0700 (PDT)
Subject: Re: remove revalidate_disk()
To: Christoph Hellwig <hch@lst.de>
Cc: Josef Bacik <josef@toxicpanda.com>,
 Dan Williams <dan.j.williams@intel.com>, dm-devel@redhat.com,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-raid@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20200901155748.2884-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <78d5ab8a-4387-7bfb-6e25-07fd6c1ddc10@kernel.dk>
Date: Wed, 2 Sep 2020 08:02:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <l0O_FSdZUID.A.wyE.hm6TfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/976
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/78d5ab8a-4387-7bfb-6e25-07fd6c1ddc10@kernel.dk
Resent-Date: Wed,  2 Sep 2020 14:18:09 +0000 (UTC)

On 9/1/20 9:57 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series removes the revalidate_disk() function, which has been a
> really odd duck in the last years.  The prime reason why most people
> use it is because it propagates a size change from the gendisk to
> the block_device structure.  But it also calls into the rather ill
> defined ->revalidate_disk method which is rather useless for the
> callers.  So this adds a new helper to just propagate the size, and
> cleans up all kinds of mess around this area.  Follow on patches
> will eventuall kill of ->revalidate_disk entirely, but ther are a lot
> more patches needed for that.

Applied, thanks.

-- 
Jens Axboe

