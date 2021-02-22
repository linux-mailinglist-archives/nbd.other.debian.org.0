Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A7321F33
	for <lists+nbd@lfdr.de>; Mon, 22 Feb 2021 19:33:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7EA18204EA; Mon, 22 Feb 2021 18:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 22 18:33:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D3AA1203D4
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Feb 2021 18:17:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oYPHc07p4yHg for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Feb 2021 18:17:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x82a.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 21F072037F
	for <nbd@other.debian.org>; Mon, 22 Feb 2021 18:17:37 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id a2so4376607qtw.12
        for <nbd@other.debian.org>; Mon, 22 Feb 2021 10:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=afQMezrHHZ/s/cFD66A7wjauGG6Mot8qzrIoVlp+Mjs=;
        b=DHrXj9tMDFBraxw7X4jINTU+CsW1tO9WZM8lqySA+3+QPTXgB75H65JRSLty4fkbc+
         grztx9O4Sd4IbLW6h05IGADg7dRhZAq2bBCyy7Zfs7aQ+pDlqpsvxmPjYAcke8FDpbbE
         DrBD29lvXrFQ2RY+nI0Me/MkOsUj+CMPIKmfgRUcJnNCFpq87TDC4MX0vXkF4LyBpxmp
         UzN7sltqmxCPCr5gdMK6dCtZTcPhHf01RKYmm1pg2neUHj1WcyVfgTRbnKw9MfszNlOz
         s386jdT7k3hR3+I5Pnz6gQNedrI7syzZSe7m/TSUilko46VXzXxU8erXuXGuYb1ThJ7D
         1Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=afQMezrHHZ/s/cFD66A7wjauGG6Mot8qzrIoVlp+Mjs=;
        b=Gb7KolOJWMlSHLmg6LWpfmXhU2ChegK6lkAXo0wfrFZ/jkOPsMFESIlFVFUdKXJUIF
         mgtt74lZtk7GaLBKUZ/fyzpFjZySnxXcrBuAngfe7ED+wGKrRTeD2TIiCLpTFi0L3+M5
         q4RJWiZlHf3g4SEZw1g8tp0UQ3emAhQTYJSn5k+qC77dDBhDH7oUnlINh1WI4uBdxS9u
         hyi1c6dC6mcpA00XQPzwotevF2+HL0ImNb3INzpcFTSGNwHgP05ZNFOHKXrqnd3nmZ58
         1sfoeLocD/aizT5Wg06NlI6tCFpmNMu8P+UclGmhzycHNQSXJ2TUNoAPluzXf/Pdw+u8
         pbxg==
X-Gm-Message-State: AOAM533S4LOTU6P7imv4WRnGUkZRmKTNawpRnQ0bvLCQT42h19drRx1E
	6M2Eizg6qv6Xyk+5GRgmqwY2vw==
X-Google-Smtp-Source: ABdhPJxL4io7CWfbZu6770iiQG2aFziBpKkjjFDeAcumIDrZ4paU3pVZ02Fog3B5IfLb8FGSlIAOyw==
X-Received: by 2002:ac8:4c8e:: with SMTP id j14mr21698071qtv.92.1614017853927;
        Mon, 22 Feb 2021 10:17:33 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id o194sm12816499qke.101.2021.02.22.10.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 10:17:33 -0800 (PST)
Subject: Re: KASAN: use-after-free Read in nbd_genl_connect
To: syzbot <syzbot+429d3f82d757c211bff3@syzkaller.appspotmail.com>,
 axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, syzkaller-bugs@googlegroups.com
References: <000000000000bda69205bbe88a09@google.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <49ac93fc-57b0-1f94-c43e-f9ab9a3913af@toxicpanda.com>
Date: Mon, 22 Feb 2021 13:17:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <000000000000bda69205bbe88a09@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eleZuKW-g6.A.EaD.lj_MgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1143
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/49ac93fc-57b0-1f94-c43e-f9ab9a3913af@toxicpanda.com
Resent-Date: Mon, 22 Feb 2021 18:33:09 +0000 (UTC)

On 2/22/21 3:25 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f40ddce8 Linux 5.11
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=179e8d22d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e53d04227c52a0df
> dashboard link: https://syzkaller.appspot.com/bug?extid=429d3f82d757c211bff3
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d190cad00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13dc8a82d00000
> 
> Bisection is inconclusive: the issue happens on the oldest tested release.
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1128ae60d00000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=1328ae60d00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1528ae60d00000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+429d3f82d757c211bff3@syzkaller.appspotmail.com
> 

#syz test:  git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git 
nbd-kasan-fix

