Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C411F951B36
	for <lists+nbd@lfdr.de>; Wed, 14 Aug 2024 14:54:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A6544204A3; Wed, 14 Aug 2024 12:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 14 12:54:09 2024
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6D6AB205E6
	for <lists-other-nbd@bendel.debian.org>; Wed, 14 Aug 2024 12:36:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.008 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id l8a9OdK4rZAn for <lists-other-nbd@bendel.debian.org>;
	Wed, 14 Aug 2024 12:36:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .ibm. - helo: .mx0b-001b2d01.pphosted. - helo-domain: .pphosted.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6520A205D6
	for <nbd@other.debian.org>; Wed, 14 Aug 2024 12:36:14 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EC9HUj019945;
	Wed, 14 Aug 2024 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=b
	sJPjT/6Ea1B7rvnaKDKbL7b/QMQrCsYxYBpyNtiNFM=; b=A6F2nRUbU1zjPcORI
	Bz7EeeyOhYO37pvAubqIQ6ZvoFPMz5mePk1GLN4quSFMG33GOpZX5xY3v10Ro8Ym
	U/vT5AbABl2Ye3K3zrwn1oKp5ukmwRDI7nyAahFb2GDQ3+Z4JxvrJvZxzEruXL9O
	xVRPR0dJa9s2mnpkOvXMEtEiJSrNQsX3fudlGMbbogle4TkPsvKVjOJkBrGaPj54
	pXJnQMgq3XEyC3dk0u9pCu29z+wJeex85yRs1+dqLh6MXSPGmy3gmA0wNn4OUjjI
	6/8KgSBaaGT2IeSn+btyEjT3d6x9siTzru1ILZcmpalTkpLe4a3XvC/dqkoE8UDB
	y3eJQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410vayg3kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 12:36:05 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47ECa4sF011177;
	Wed, 14 Aug 2024 12:36:04 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410vayg3kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 12:36:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47EA6eiF015654;
	Wed, 14 Aug 2024 12:36:03 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xm1ms7ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 12:36:03 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47ECa1Mv37159306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 12:36:03 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32C1F58059;
	Wed, 14 Aug 2024 12:36:01 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0250458057;
	Wed, 14 Aug 2024 12:35:59 +0000 (GMT)
Received: from [9.179.26.14] (unknown [9.179.26.14])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Aug 2024 12:35:58 +0000 (GMT)
Message-ID: <1f917bc1-8a6a-4c88-a619-cf8ddc4534a4@linux.ibm.com>
Date: Wed, 14 Aug 2024 18:05:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.11-rc1 kernel
To: Yi Zhang <yi.zhang@redhat.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "nbd@other.debian.org" <nbd@other.debian.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <5yal5unzvisrvfhhvsqrsqgu4tfbjp2fsrnbuyxioaxjgbojsi@o2arvhebzes3>
 <ab363932-ab3d-49b1-853d-7313f02cce9e@linux.ibm.com>
 <ljqlgkvhkojsmehqddmeo4dng6l3yaav6le2uslsumfxivluwu@m7lkx3j4mkkw>
 <79a7ec0d-c22d-44cf-a832-13da05a1fcbd@linux.ibm.com>
 <CAHj4cs-5DPDFuBzm3aymeAi6UWHhgXSYsgaCACKbjXp=i0SyTA@mail.gmail.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <CAHj4cs-5DPDFuBzm3aymeAi6UWHhgXSYsgaCACKbjXp=i0SyTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bp1rq0apsdM9niQJZVvNn3tTd7kViB8H
X-Proofpoint-ORIG-GUID: vAX11F9Zt3keo_Gii_MidOWxXLeQu6YU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_09,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140088
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JQTgdrGQVCC.A.vfe.xjKvmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3140
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1f917bc1-8a6a-4c88-a619-cf8ddc4534a4@linux.ibm.com
Resent-Date: Wed, 14 Aug 2024 12:54:09 +0000 (UTC)



On 8/13/24 12:36, Yi Zhang wrote:
> On Sat, Aug 3, 2024 at 12:49 AM Nilay Shroff <nilay@linux.ibm.com> wrote:
> 
> There are no simultaneous tests during the CKI tests running.
> I reproduced the failure on that server and always can be reproduced
> within 5 times:
> # sh a.sh
> ==============================0
> nvme/052 (tr=loop) (Test file-ns creation/deletion under one subsystem) [passed]
>     runtime  21.496s  ...  21.398s
> ==============================1
> nvme/052 (tr=loop) (Test file-ns creation/deletion under one subsystem) [failed]
>     runtime  21.398s  ...  21.974s
>     --- tests/nvme/052.out 2024-08-10 00:30:06.989814226 -0400
>     +++ /root/blktests/results/nodev_tr_loop/nvme/052.out.bad
> 2024-08-13 02:53:51.635047928 -0400
>     @@ -1,2 +1,5 @@
>      Running nvme/052
>     +cat: /sys/block/nvme1n2/uuid: No such file or directory
>     +cat: /sys/block/nvme1n2/uuid: No such file or directory
>     +cat: /sys/block/nvme1n2/uuid: No such file or directory
>      Test complete
> # uname -r
> 6.11.0-rc3

We may need to debug this further. Is it possible to patch blktest and 
collect some details when this issue manifests? If yes then can you please
apply the below diff and re-run your test? This patch would capture output 
of "nvme list" and "sysfs attribute tree created under namespace head node"
and store those details in 052.full file. 

diff --git a/common/nvme b/common/nvme
index 9e78f3e..780b5e3 100644
--- a/common/nvme
+++ b/common/nvme
@@ -589,8 +589,23 @@ _find_nvme_ns() {
                if ! [[ "${ns}" =~ nvme[0-9]+n[0-9]+ ]]; then
                        continue
                fi
+               echo -e "\nBefore ${ns}/uuid check:\n" >> ${FULL}
+               echo -e "\n`nvme list -v`\n" >> ${FULL}
+               echo -e "\n`tree ${ns}`\n" >> ${FULL}
+
                [ -e "${ns}/uuid" ] || continue
                uuid=$(cat "${ns}/uuid")
+
+               if [ "$?" = "1" ]; then
+                       echo -e "\nFailed to read $ns/uuid\n" >> ${FULL}
+                       echo "`nvme list -v`" >> ${FULL}
+                       if [ -d "${ns}" ]; then
+                               echo -e "\n`tree ${ns}`\n" >> ${FULL}
+                       else
+                               echo -e "\n${ns} doesn't exist!\n" >> ${FULL}
+                       fi
+               fi
+
                if [[ "${subsys_uuid}" == "${uuid}" ]]; then
                        basename "${ns}"
                fi


After applying the above diff, when this issue occurs on your system copy this 
file "</path/to/blktests>/results/nodev_tr_loop/nvme/052.full" and send it across. 
This may give us some clue about what might be going wrong. 

Thanks,
--Nilay

